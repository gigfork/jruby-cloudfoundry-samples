require 'rubygems'
require 'sinatra'
require 'json'
require 'bunny'

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

def client
  unless $client
    begin
      credentials = JSON.parse(ENV['VCAP_SERVICES'])['rabbitmq-2.4'].first['credentials']
      host  = credentials['host']
      vhost = credentials['vhost']
      port  = credentials['port']
      user  = credentials['user']
      pass  = credentials['pass']
    rescue
      host  = 'localhost'
      vhost ='/'
      port  = 6379
      user  = 'guest'
      pass  = 'guest'
    end
    c = Bunny.new(:host  => host,
                  :vhost => vhost,
                  :port  => port,
                  :user  => user,
                  :pass  => pass)
    c.start
    $client = c
    c.qos :prefetch_count => 1
  end
  $client
end

get '/rabbitmq/send/:message' do |m|

  client.exchange('').publish m, :content_type => "text/plain",
                            :key => "messages"

  "<h2>Message was successfully queued.</h2>"

end

get '/rabbitmq' do

  res = ''
  res << "<h1>Received messages :</h1>"
  res << "<ul>"
  messages_queue ||= client.queue("messages")
  messages_queue.subscribe(:ack => true,
                           :timeout => 10,
                           :message_max => 10) do |msg|
    res << "<li>#{msg[:payload]}</li>"
  end
  res << "</ul>"

  res

end
