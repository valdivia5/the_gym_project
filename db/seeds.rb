require_relative( "../models/member.rb" )
require_relative( "../models/booking.rb" )
require_relative( "../models/activity.rb" )
require_relative( "sqlrunner.rb" )
require("pry")

Booking.delete_all()
Member.delete_all()
Activity.delete_all()

member1 = Member.new({
"first_name" => "Luis",
"last_name" => "Puchito Suarez"
  })
member1.save()
member2 = Member.new({
"first_name" => "Ana",
"last_name" => "Pelana"
  })
member2.save()
member3 = Member.new({
"first_name" => "Jesus",
"last_name" => "Papinga"
  })
member3.save()

member4 = Member.new({
"first_name" => "Mario",
"last_name" => "Bros"
  })
member4.save()

#----------------------------------------------------------
activity1 = Activity.new({
"name" => "Push-up hour",
"date_and_time" => "29/10/2019 8:00AM"
  })
activity1.save()

activity2 = Activity.new({
"name" => "Yoga hour",
"date_and_time" => "29/10/2019 9:00AM"
  })
activity2.save()

activity3 = Activity.new({
"name" => "Leg hour",
"date_and_time" => "29/10/2019 10:00AM"
  })
activity3.save()

activity4 = Activity.new({
"name" => "Twerk lesson",
"date_and_time" => "29/10/2019 14:00AM"
  })
activity4.save()

#----------------------------------------------------------
booking1 = Booking.new({
  "member_id" => member1.id,
  "activity_id" => activity1.id
})
booking1.save()

booking2 = Booking.new({
  "member_id" => member2.id,
  "activity_id" => activity2.id
})
booking2.save()

booking3 = Booking.new({
  "member_id" => member3.id,
  "activity_id" => activity3.id
})
booking3.save()

booking4 = Booking.new({
  "member_id" => member4.id,
  "activity_id" => activity4.id
})
booking4.save()


binding.pry
nil
