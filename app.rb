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
       words= ["Jazz","Electronic","Country","Pop","Metal","Indie","Hip Hop","Rap","Rock","K Pop","Classical","Death Metal","Opera","Acoustic","Folk","Blues"]

   artist = RSpotify::Artist.search(words.sample).first

  
     related_artist = artist.related_artists.sample
    @song = related_artist.top_tracks(:US).sample.name
    #This is the artist name that will print out on the website
    @song_play = related_artist.top_tracks(:US).sample.preview_url
  		erb :gif 
  end
end


     

 