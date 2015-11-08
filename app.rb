require 'json'
require 'sinatra'

get '/' do
  "<html>" + 
  "<head>" + 
  "<title>Factors of #{Time.now.year}</title>" +
  "<link href='//fonts.googleapis.com/css?family=Source+Sans+Pro:300,400' rel='stylesheet' type='text/css'>" +
  "<style>" +
  "body{background-color:#1f1f1f;color:#fff;font-family:'Source Sans Pro',sans-serif;font-size:3.5vw;font-weight:300;padding:32px}h1,h2{margin:0;padding:0}h1{font-size:10vw;font-weight:300}" +
  "</style>" + 
  "</head>" + 
  "<body><h1>Factors of #{Time.now.year}</h1>#{Time.now.year.factors}</body>" +
  "</html>"
end

get '/api?:q?' do
  factors = []

  if params['q']
    factors = params['q'].to_i.factors
  else
    factors = Time.now.year.factors
  end

  content_type :json
  { factors: factors }.to_json
end

class Integer
  def factors() (1..self).select { |n| (self % n).zero? } end
end
