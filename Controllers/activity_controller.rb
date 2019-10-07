require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/activity.rb')
also_reload('../models/*')

get '/activities' do
  @activities = Activity.all()
  erb (:"activity/index")
end

get '/activities/:id' do
  @activities = Activity.find(params['id'].to_i)
  erb(:"activity/show")
end
