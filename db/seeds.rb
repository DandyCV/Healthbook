# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
doctors = Doctor.create([{name: 'Serhii', surname: 'Velychko', specialization: 'family doctor',
                         phone_number: '+380996603516', work_hours: '09:00 - 17:00'},
                         {name: 'Viktoria', surname: 'Brus', specialization: 'family doctor',
                          phone_number: '+380503741154', work_hours: '09:00 - 17:00'},
                         {name: 'Denis', surname: 'Pinchuk', specialization: 'family doctor',
                          phone_number: '+380991552700', work_hours: '09:00 - 17:00'}])
