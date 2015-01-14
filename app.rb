require 'bundler'
require "net/http"
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
  	uri = URI('http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC')
  	hash = Net::HTTP.get(uri)
 	 @image = hash["data"]["image_url"]
   		erb :index
  end
  get '/gif' do
  	uri = URI('http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC')
  	hash = Net::HTTP.get(uri)
  	@image = hash["data"]["image_url"] 
  		erb :gif 
  end
end