require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end

get '/members/:id' do
  @members = Member.find(params['id'].to_i)
  erb(:"members/show")
end

get '/members/new' do
  @activities = Activity.all
  @members = Member.all
  redirect to("/members")
  erb(:"members/new")
end

post '/members' do
  member = Member.new(params)
  member.save
  redirect to("/members")
end

post '/members/:id/delete' do
  Member.delete(params[:id])
  redirect to("/members")
end

get "/members/:id/edit" do
  @member = Member.find(params["id"])
  @activity = Activity.all
  erb(:edit)
end

get "/members/:id" do
  @member = Member.find(params["id"])
  erb(:show)
end
