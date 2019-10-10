require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/activity.rb')
also_reload('../models/*')

#---------- NEW/CREATE--------------------------

get '/activities/new' do
  @activities = Activity.all
  erb(:"activities/new")
end

post '/activities' do
  activity = Activity.new(params)
  activity.save
  redirect to("/activities")
end
#---------------INDEX/SHOW------------------------

get '/activities' do
  @activities = Activity.all()
  erb (:"activities/index")
end

get '/activities/:id/show' do
  @activity = Activity.find(params['id'].to_i)
  erb(:"activities/show")
end

#---------- EDIT/UPDATE--------------------------
get "/activities/:id/edit" do
  @activity = Activity.find(params["id"].to_i)
  erb(:"activities/edit")
end


post "/activities/:id/update" do
  @activity = Activity.new(params)
  @activity.update()
  redirect to("/activities")
end
#------------------------DELETE-------------------------

post "/activities/:id/delete" do
  activity = Activity.find (params["id"].to_i)
  activity.delete
  redirect to("/activities")
end
