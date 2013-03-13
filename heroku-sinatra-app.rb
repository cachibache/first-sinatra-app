# Remember to run the server when testing locally
# by going ruby heroku-sinatra-app.rb
# then go to localhost:4567 in your browser
#
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'data_mapper'
require 'erb'

require './lib/bike.rb'
# require './lib/garage.rb'
require './lib/location.rb'
# require './lib/person.rb'
# require './lib/station.rb'
# require './lib/van.rb'

DataMapper::setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/boris_bikes')
DataMapper.finalize.auto_upgrade!

get '/' do 
  erb :index
end

get '/add_bikes' do
  erb :add_bikes
end

post '/add_bikes' do
  bike = Bike.new
  bike.break! if params[:status] == "Broken"
  bike.save

  redirect "/show_bikes"
end

get '/show_bikes' do
  bikes = Bike.all
  erb :show_bikes, :locals => {:bikes => bikes}
end

get '/station' do
  erb :station
end

post '/add_station' do
  station = Station.new
  station.save

  redirect "/show_station"
end

get '/show_station' do
  stations = Station.all
  erb :show_stations, :locals => {:stations => stations}
end

# @stations = []
  # 4.times { @stations << Station.new }
  # @stations.each { |station| station << 30.times do
  #     Bike.new
  # end }


  # @people = []
  # 1000.times { @people << Person.new }
  # @people.each { |p| p.take_bike_from @stations[rand(4)]  if rand < 0.25 }

  # @people.each do |p|
  #   if p.has_bike? != nil && rand < 0.3
  #     @stations.shuffle!.each do |station|
  #       station << p.release_bike @bike
  #       break if p.has_bike? == nil
  #     end
  #   end 

# get '/results' do
#   @stations = [1]
#   erb :results
# end

  # Test at <appname>.heroku.com (you'll need to create your app first!)

  # Usage: partial :foo
helpers do
  def partial(page, options={})
    erb page, options.merge!(:layout => false)
  end
end
