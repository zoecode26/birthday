require 'sinatra/base'
require './lib/birthday'

class MyApp < Sinatra::Base
  enable :sessions
  set :session_secret, "here be dragons"
  set :public_folder, 'public'

  get '/' do
    erb :index
  end

  post '/details' do
    p params
    $name = params['name']
    $day = params['day']
    $month = params['month']
    redirect to('/result')
  end

  get '/result' do
    @name = $name
    @days_to_go = Birthday.new($day, $month).calculate
    erb :result
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
