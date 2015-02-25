# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

defaults = {
    name: 'Admin',
    email: 'admin@example.com',
    password: 'admin123'
}

if User.count == 0
  puts 'Creating Admin user with defaults: ' +
    "email = '#{defaults[:email]}', password = '#{defaults[:password]}'"
  User.create! defaults
end
