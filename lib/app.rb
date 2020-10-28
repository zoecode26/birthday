require 'sinatra/base'
require './lib/birthday'

class MyApp < Sinatra::Base
  enable :sessions
  set :session_secret, "here be dragons"

  get '/' do
    erb :index
  end

  post '/details' do
    p params
    $name = params['name']
    $day = params['day']
    $month = params['month']
    p $name
    p $day
    p $month
    redirect to('/result')
  end

  get '/result' do
    p $name
    p $day
    p $month
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
