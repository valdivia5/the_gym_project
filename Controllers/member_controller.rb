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
