# frozen_string_literal: true

def get_repos(_uri)
  client = Octokit::Client.new(access_token: (ARGUMENTS['token']).to_s)
  client.auto_paginate = true
  results = client.repos(ARGUMENTS['username'])
  puts "Success! We found #{results.size} repos.".green
  ARGUMENTS['repos'] = results
  # escaped_url = URI::DEFAULT_PARSER.escape(uri)
  # uri = URI.parse(escaped_url)
  # Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
  #   request = Net::HTTP::Get.new(uri)
  #   request['accept'] = 'application/vnd.github.v3+json'
  #   request.basic_auth(' ', "Basic #{ARGUMENTS['token']}")
  #   response = http.request(request)
  #   { data: response_data(response), header: response.header }
  # end
end

def get_repos_with_paging(uri)
  results = []
  page = 1

  escaped_base_url = URI::DEFAULT_PARSER.escape("#{uri}&page=#{page}")
  uri = escaped_base_url.to_s
  response = get_repos(uri)
  results.concat(response.fetch(:data))
  binding.pry
  # TODO: LINK Example
  # "<https://api.github.com/user/17ff/repos?per_page=100&page=1>; rel=\"prev\", <https://api.github.com/user/176ffff/repos?per_page=100&page=1>; rel=\"first\""
  until response.fetch(:data).empty?
    page += 1
    uri = "#{uri}&page=#{page}"
    response = get_repos(uri)
    binding.pry
    results.concat(response.fetch(:data))
  end
  puts "Success! We found #{results.size} repos.".green
  ARGUMENTS['repos'] = results
end

def response_data(response)
  return unless response.code == '200'

  JSON.parse(response.body)
end

def remove_repo(full_repo_name)
  puts "\nRemoving: #{full_repo_name}"
  client = Octokit::Client.new(access_token: (ARGUMENTS['token']).to_s)
  response = client.delete_repository(full_repo_name.to_s)
  if response
    puts "Successfully removed #{full_repo_name}"
  else
    puts "ERROR: Issue occurred repo may have not been deleted."
  end
  response
end
