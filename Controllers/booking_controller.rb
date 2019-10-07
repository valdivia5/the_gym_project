require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/booking.rb')
require_relative('../models/activity.rb')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/bookings' do
  @bookings = Booking.all
  erb ( :"bookings/index" )
end

get '/bitings/new' do
  @activities = Booking.all
  @members = Member.all
  erb(:"bookings/new")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to("/bookings")
end

post '/bookings/:id/delete' do
  Booking.destroy(params[:id])
  redirect to("/bookings")
end
