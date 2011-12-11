require 'rubygems'
require 'sinatra'
require 'json'
require 'active_record'

configure do

  begin
    services = JSON.parse(ENV['VCAP_SERVICES'])
    serviceKey = services.keys.select{|s| s =~ /postgresql/i}.first
    service = services[serviceKey].first['credentials']
    host = service['host']
    port = service['port']
    username = service['username']
    password = service['password']
    database = service['name']
  rescue
    # connect local postgresql server
    #host = 'localhost'
    #port = 5432
    #username = nil
    #password = nil
    #database = 'test'
  
    # connect postgresql service via caldcott
    host = 'localhost'
    port = 10000
    username = 'xxxxx'
    password = 'xxxxx'
    database = 'xxxxx'
  end

  ActiveRecord::Base.establish_connection(
    :adapter  => 'jdbcpostgresql',
    :hostname => host,
    :port     => port,
    :database => database,
    :username => username,
    :password => password
  )

  class Message < ActiveRecord::Base
  end
  
end

get '/' do
  host = ENV['VMC_APP_HOST']
  port = ENV['VMC_APP_PORT']
  res = ''
  res << "<h1>XXXXX Hello from the Cloud! via: #{host}:#{port}</h1>"
  res << "<ul>"
  res << "<li>RUBY_ENGINE : #{ defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'unknown' }</li>"
  res << "<li>RUBY_VERSION : #{ defined?(RUBY_VERSION) ? RUBY_VERSION : 'unknown' }</li>"
  res << "<li>JRUBY_VERSION : #{ defined?(JRUBY_VERSION) ? JRUBY_VERSION : 'unknown' }</li>"
  res << "</ul>"
  res
end

get '/env' do
  res = ''
  ENV.each do |k, v|
    res << "#{k}: #{v}<br/>"
  end
  res
end

get '/env_java' do
  res = ''
  java.lang.System.getProperties.each do |k, v|
    res << "#{k}: #{v}<br/>"
  end
  res
end

get "/postgresql" do
  res = ''
  Message.all.each do |m|
    res << "#{m.message}<br/>"
  end
  res
end

get "/postgresql/add/:message" do |m|
  Message.create :message => m
  redirect to('/postgresql')
end

