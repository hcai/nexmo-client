# encoding: UTF-8

require 'nexmo-client'

# Load credentials from ENV if possible, or load from _creds.rb
if ENV['API_KEY'] && ENV['API_SECRET'] 
  API_KEY = ENV['API_KEY']
  API_SECRET = ENV['API_SECRET']
else
  begin
    require '_creds'
  rescue LoadError
    puts "Using _creds.stub.rb, create a _creds.rb with actual credentials for a live test."
  end
end
