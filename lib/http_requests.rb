# frozen_string_literal: true

def get_repos
  client = Octokit::Client.new(access_token: (ARGUMENTS['token']).to_s)
  client.auto_paginate = true
  results = client.repos(ARGUMENTS['username'])
  if results.empty?
    puts "No repos found!".red
    ARGUMENTS['repos'] = results
  else
    ARGUMENTS['repos'] = results
    puts "Success! We found #{results.size} repos.".green
  end
end

def remove_repo(full_repo_name)
  puts "\nRemoving: #{full_repo_name}"
  client = Octokit::Client.new(access_token: (ARGUMENTS['token']).to_s)
  response = client.delete_repository(full_repo_name.to_s)
  if response
    puts "Successfully removed #{full_repo_name}. \n\n"
  else
    puts "ERROR: Issue occurred repo may have not been deleted."
  end
  response
end
