# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'admin1' , password_digest: BCrypt::Password.create('2212') , admin: 1, team_id: 1)
User.create(username: 'student1' , password_digest: BCrypt::Password.create('2212') , admin: 0, team_id: 1)
User.create(username: 'student2' , password_digest: BCrypt::Password.create('2212') , admin: 0, team_id: 1)
User.create(username: 'student3' , password_digest: BCrypt::Password.create('2212') , admin: 0, team_id: 1)
User.create(username: 'student4' , password_digest: BCrypt::Password.create('2212') , admin: 0, team_id: 1)
User.create(username: 'student5' , password_digest: BCrypt::Password.create('2212') , admin: 0, team_id: 1)
User.create(username: 'student6' , password_digest: BCrypt::Password.create('2212') , admin: 0, team_id: 1)

Team.create(name: 'Team1')

Event.create(name: 'Dallas Regional', date: '1/1/2020', location:'Conrad High School Dallas Tx', team_id: 1)
