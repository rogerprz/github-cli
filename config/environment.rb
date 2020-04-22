# frozen_string_literal: true

require('bundler')
require('json')
require('net/http')
require('dotenv')
require 'octokit'
require "tty-prompt"
require 'colorize'

Dotenv.load
Bundler.require

require_all('lib')
