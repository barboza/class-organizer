require 'sinatra'
require 'slim'

get '/' do
	@data = Array[1,2,3,4,5,6,7,8,9]
	slim :index
end