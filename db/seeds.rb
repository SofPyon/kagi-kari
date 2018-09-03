# Users
sofpyon = User.create(screen_name: "sofpyon", name: "SofPyon",
                      password: "password", password_confirmation: "password")

# Rooms
rooms = []
rooms << Room.create(name: "Main Room", description: "A room used mainly.")
rooms << Room.create(name: "Sub Room", description: "")

# Activities
rooms.each do |room|
  room.activities.create(user_id: sofpyon.id, action: 1) # borrowing
  room.activities.create(user_id: sofpyon.id, action: 0) # returning
end