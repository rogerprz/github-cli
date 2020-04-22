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

def print_options
  prompt = TTY::Prompt.new
  print TTY::Box.frame(
    align: :center, padding: [1, 10, 1, 10], title: { top_left: 'Github', bottom_right: '@rogerprz' }
  ) { "AVAILABLE OPTIONS" }
  input =
    prompt.select('', symbols: { marker: '->' }) do |menu|
      menu.choice 'View available repos - pr', "pr", key: "pr"
      menu.choice 'Select repos to remove', 'mrd'
      menu.choice 'Delete single repo', "dr"
      menu.choice 'Remove all repos (Dangerous)', "dar"
      menu.choice 'Exit program', "exit", key: 'e'
    end
  input
end
