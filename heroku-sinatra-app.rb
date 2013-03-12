# Remember to run the server when testing locally
# by going ruby heroku-sinatra-app.rb
# then go to localhost:4567 in your browser
#
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/bike.rb'
require './lib/garage.rb'
require './lib/location.rb'
require './lib/person.rb'
require './lib/station.rb'
require './lib/van.rb'


# for templates uncomment the line below
require 'erb'



get '/' do
  4.times {Station.new}
  erb :control
end

get '/results' do
  @stations = [1]
  erb :results
end

# Test at <appname>.heroku.com (you'll need to create your app first!)

# Usage: partial :foo
helpers do
  def partial(page, options={})
    erb page, options.merge!(:layout => false)
  end
end