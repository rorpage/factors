require 'haml'
require 'json'
require 'sinatra'

get '/' do
  haml :index, :locals => { factors: Time.now.year.factors, year: Time.now.year }
end

get '/api?:q?' do
  factors = params['q'] ? params['q'].to_i.factors : Time.now.year.factors
  content_type :json
  { factors: factors }.to_json
end

class Integer
  def factors() (1..self).select { |n| (self % n).zero? } end
end
