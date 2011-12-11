require 'rubygems'
require 'sinatra'
require 'json'
require 'redis'
require 'haml'

configure do

  begin
    credentials = JSON.parse(ENV['VCAP_SERVICES'])['redis-2.2'].first['credentials']
    host = credentials['hostname']
    port = credentials['port']
    name = credentials['name']
    password = credentials['password']
  rescue
    host = 'localhost'
    port = 6379
  end
  
  $redis =Redis.new(:host => host,
                    :port => port,
                    :name => name,
                    :password => password)
  $redis.ping

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

get '/redis' do
  @c = $redis.incr("counter")
  haml :counter
end

