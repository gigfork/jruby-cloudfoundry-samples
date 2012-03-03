# -*- mode: ruby -*-

require 'rubygems'
require 'sinatra'
require './app'

set :run, false
set :environment, :production
run Sinatra::Application
