# Users
sofpyon = User.create(screen_name: "sofpyon", name: "SofPyon",
                      password: "password", password_confirmation: "password")

# Rooms
Room.create(name: "Main Room", description: "A room used mainly.")
Room.create(name: "Sub Room", description: "")