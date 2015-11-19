require 'haml'
require 'json'
require 'sinatra'

get '/api/?:q?' do
  content_type :json
  get_data(params['q']).to_json
end

get '/?:q?' do
  haml :index, :locals => get_data(params['q'])
end

def get_data(query)
  number = query ? query.to_i : Time.now.year
  factors = number.factors
  { number: number, factors: factors }
end

class Integer
  def factors() (1..self).select { |n| (self % n).zero? } end
end
