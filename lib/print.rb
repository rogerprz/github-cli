# frozen_string_literal: true

def print_welcome
  TTY::Link.link_to(
    '@rogerprz',
    "https://github.com/rogerprz"
  )
  print TTY::Box.frame(
    align: :center,
    padding: [1, 10, 1, 10],
    title: {
      top_left: 'Github',
      bottom_right: '@rogerprz'
    }
  ) {
          "WELCOME TO GITHUB CLI".on_red
        }
end

def print_repos(repos)
  repos.each do |repo|
    puts TTY::Link.link_to((repo['full_name']).to_s, repo['html_url'])
  end
  puts "Total: #{repos.size}".green
end

def print_options
  prompt = TTY::Prompt.new
  print TTY::Box.frame(
    align: :center, padding: [1, 10, 1, 10], title: { top_left: 'Github', bottom_right: '@rogerprz' }
  ) { "AVAILABLE OPTIONS" }
  input =
    prompt.select('', symbols: { marker: '->' }) do |menu|
      menu.choice 'View available repos - pr', "pr", key: "pr"
      menu.choice 'Select repos to remove', 'mrd'
      menu.choice 'Exit program', "exit", key: 'e'
    end
  input
end

def print_delete_repos_warning_message(repos)
  print TTY::Box.frame(
    align: :center, padding: [1, 10, 1, 10], title: { top_left: 'Github', bottom_right: '@rogerprz' }
  ) {
    "WARNING \n
    You are going to permanently remove #{repos.size} repos. \n
    CONFIRM\n
    yes/y or no/n to return to main menu
    ".red
  }
  repos.each { |repo| puts repo.red }
  puts "\n\n"
end
