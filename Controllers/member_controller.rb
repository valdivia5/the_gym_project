require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
also_reload('../models/*')
#---------- NEW/CREATE--------------------------

get '/members/new' do
  @members = Member.all
  redirect to("/members")
  erb(:"members/new")
end

post '/members' do
  member = Member.new(params)
  member.save
  redirect to("/members")
end
#---------------INDEX/SHOW------------------------

get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end

get "/members/:id" do
  @member = Member.find(params["id"].to_i)
  erb(:show)
end

#-----------------DELETE-------------------------

post '/members/:id/delete' do
  Member.delete(params[:id])
  redirect to("/members")
end
#-----------------edit/post-------------------------

get "/members/:id/edit" do
  @member = Member.find(params["id"])
  @activity = Activity.all(params["id"])
  erb(:edit)
end

post "/members/:id" do
  @member = Member.find(params["id"])
  erb(:show)
end
