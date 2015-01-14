require 'bundler'
require "net/http"
require 'json'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
   		erb :index
  end
  get '/gif' do
  	uri = URI('http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC')
  	api_response = Net::HTTP.get(uri)
  	hash= JSON.parse(api_response)
  	@image = hash["data"]["image_url"] 
  		erb :gif 
  end
end