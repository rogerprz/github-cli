# frozen_string_literal: true

require 'dotenv/load'
include TTY::Color

def start
  ARGV.each do |a|
    params = a.split(':')
    ARGUMENTS[params[0]] = params[1]
    puts "Entered: #{params[0]}"
  end
  ARGV.clear
  print_welcome
  get_repos("https://api.github.com/users/#{ARGUMENTS['username']}/repos?per_page=100")
  main_menu
end

def main_menu
  input = print_options
  puts "Selected: #{input}\n".green
  menu_input(input)
end

def filter_repos
  menu_input(print_options)
end

def print_repos(repos)
  repos.each do |repo|
    puts TTY::Link.link_to((repo['full_name']).to_s, repo['html_url'])
  end
  puts "Total: #{repos.size}".green
end

def menu_input(input)
  case input
  when 'pr'
    print_repos(ARGUMENTS['repos'])
    main_menu
  when 'mrd'
    select_multiple_repos
  when 'exit', 'e'
    abort('Goodbye')
  else
    puts 'Not a valid option'.red
    main_menu
  end
end

def select_multiple_repos
  prompt = TTY::Prompt.new
  repos = ARGUMENTS['repos'].map { |repo| repo['full_name'] }
  puts "\n"
  results = prompt.multi_select('Select the repos you would like to remove'.blue, repos, filter: true)
  puts results
  confirm_filtered_repo_removal(results)
end

def confirm_filtered_repo_removal(repos)
  print_confirm_delete_repos(repos)
  input = gets.chomp

  case input
  when 'yes', 'y'
    handle_repo_removal(repos)
  when 'no', 'n'
    main_menu
  else
    puts "Invalid option"
    confirm_filtered_repo_removal
  end
end

def handle_repo_removal(repos)
  repos.each do |repo|
    repo_name = repo["full_name"] || repo
    remove_repo(repo_name)
  end
  main_menu
end
