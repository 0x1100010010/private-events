# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@users = User.create!([{ name: 'x', username: 'x' }, { name: 'y', username: 'y' }, { name: 'z', username: 'z' } ])

@users.each_with_index do |user, i|
  
  user.events.create!([
    { name: 'event_by_'+user.name+'_'+i.to_s, description: 'event_discription_'+i.to_s, location: 'location_'+i.to_s, start_time: Time.current, end_time: i.hour.from_now, date: Date.current },
    { name: 'event_by_'+user.name+'_'+(i+1).to_s, description: 'event_discription_'+(i+1).to_s, location: 'location_'+(i+1).to_s, start_time: (i+2).hour.from_now, end_time: (i+3).hour.from_now, date: (i+1).day.from_now.to_date },
    # { name: 'event_by_'+user.name+'_'+(i+2).to_s, description: 'event_discription_'+(i+2).to_s, location: 'location_'+(i+2).to_s, start_time: (i+24).hour.from_now, end_time: (i+30).hour.from_now, date: (i+2).day.from_now.to_date }
  ])
end

# @users.each_with_index do |user, i|
#   (@users.select { |u| u.id!=user.id }).each do |u|  
#     user.event_enrolments.create!([ {user_id: u.id, event_id: user.events.sample} ])
#   end
# end 