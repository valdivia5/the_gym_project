require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/booking.rb')
require_relative('../models/activity.rb')
require_relative('../models/member.rb')
also_reload('../models/*')

#---------------INDEX/SHOW------------------------
get '/bookings' do
  @bookings = Booking.all
  erb ( :"bookings/index" )
end

get '/bookings/:id' do
  @bookings = Booking.find(params['id'].to_i)
  erb(:"bookings/show")
end
#---------------NEW/CREATE------------------------

get '/bookings/new' do
  @activities = Activity.all
  @members = Member.all
  erb(:"bookings/new")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to("/bookings")
end
#---------------DELETE------------------------
post '/bookings/:id/delete' do
  Booking.delete(params[:id])
  redirect to("/bookings")
end
