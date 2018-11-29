# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#creating users
Room.destroy_all
User.destroy_all

puts "Destroy all the rooms and users. Users have email as <their_first_name_lowercase@mail.com>, and password as <12345678>."

ian = User.new(email: 'ian@mail.com',first_name: 'Ian', last_name: 'Hunter', city: 'Hong Kong', password: '12345678')
ian.save

annie = User.new(email: 'annie@mail.com',first_name: 'Annie', last_name: 'Gilchrist', city: 'London',  password: '12345678')
annie.save

xun = User.new(email: 'xun@mail.com', first_name: 'Xun', last_name: 'Ma', city: 'Chengdu', password: '12345678')
xun.save

dean = User.new(email: 'dean@mail.com', first_name: 'Dean', last_name: 'Wheeler', city: 'Barcelona', password: '12345678')
dean.save

#creating rooms w/o images


  a = [
    {'Shanghai'=> '222 Hubin Road, Shanghai'},
    {'Shanghai'=> 'Shanghai Disneyland, Shanghai'},
    {'Chengdu' => 'Tianfu Square, Chengdu'},
    {'Chengdu' => 'Jinli, Chengdu'},
    {'Beijing' => 'Sanlitun, Beijing'},
    {'Beijing' => 'Tiananmen Square, Beijing'},
    {'Barcelona' => 'Sagrada Familia, Barcelona'},
    {'Barcelona' => 'Le Wagon Barcelona, Barcelona'},
    {'Hong Kong' => '88 Red Hill Road, Hong Kong'},
    {'Hong Kong' => 'Hong Kong Disneyland, Hong Kong'},
    {'Seoul' => 'Gyeongbokgung, Seoul'},
    {'Seoul' => 'Incheon International Airport, Seoul'}
  ]

  a.each do |h|
    instrument = ['Piano', 'Drums', 'Harp', 'Cello', 'Guitar'].sample
    user = User.all.sample
    description = ['Great', 'Nice sound texture', 'delicate', '💕', 'Good sound proof', 'Has recording geers', 'Available 24 hours a day', 'Historical'].sample
    price = rand(10..30)
    location = h.keys[0]
    address = h.values[0]
    room = Room.new(location: location, address: address, instrument_type: instrument, description: description, price: price, currency: 'Euro')
    room.user = user
    room.save
  end







