# -*- mode: ruby -*-

require 'rubygems'
require 'bundler/setup'
require './app'
require 'rack/content_length'

set :run, false
set :environment, :production
use Rack::ContentLength
run Sinatra::Application
