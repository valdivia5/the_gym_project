require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/activity.rb')
also_reload('../models/*')


#---------------INDEX/SHOW------------------------

get '/activities' do
  @activities = Activity.all()
  erb (:"activities/index")
end

get '/activities/:id' do
  @activities = Activity.find(params['id'].to_i)
  erb(:"activities/show")
end

#---------- NEW/CREATE--------------------------

get '/activities/new' do
  @activities = Activity.all
  redirect to("/activities")
  erb(:"activities/new")
end

post '/activities' do
  activity = Activity.new(params)
  activity.save
  redirect to("/activities")
end
#---------- NEW/CREATE--------------------------
get "/members/:id/edit" do
  @member = Member.find(params["id"])
  @activity = Activity.all
  erb(:edit)
end

post "/members/:id" do
  @member = Member.find(params["id"])
  erb(:show)
end
