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
  get_repos
  main_menu
end

def main_menu
  input = print_options
  puts "Selected: #{input}\n".yellow
  menu_input(input)
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
  results = prompt.multi_select(
    "Select the repos you would like to remove \n
    Press Spacebar to select\n
    Press Enter to confirm\n".green,
    repos,
    filter: true
  )

  confirm_repos_removal(results)
end

def confirm_repos_removal(repos)
  print_delete_repos_warning_message(repos)
  input = gets.chomp

  case input
  when 'yes', 'y'
    handle_repo_removal(repos)
  when 'no', 'n'
    main_menu
  else
    puts "Invalid option"
    confirm_repos_removal
  end
end

def handle_repo_removal(repos)
  repos.each do |repo|
    repo_name = repo["full_name"] || repo
    remove_repo(repo_name)
  end
  get_repos
  main_menu
end
