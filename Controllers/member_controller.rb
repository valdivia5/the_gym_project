require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
also_reload('../models/*')

#---------- NEW/CREATE------------------WORKING!!!!--------

get '/members/new' do
  @members = Member.all
  @activities = Activity.all
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


#-----------------edit/post-------------------------

get "/members/:id/edit" do
  @member = Member.find(params["id"].to_i)
  erb(:"members/edit")
end


post "/members/:id/update" do
  @member = Member.new(params)
  @member.update()
  redirect to("/members")
end

# post "/members/:id" do
#   @member = Member.new(params)
#   @member.update()
#   erb(:update)
# end



#-----------------DELETE----------------WORKING!!!---------

post '/members/:id/delete' do
  member = Member.find(params["id"].to_i)
  member.delete
  redirect to("/members")
end
