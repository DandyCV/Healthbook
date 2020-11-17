# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
doctors = Doctor.create([{name: 'Serhii', surname: 'Velychko', specialization: 'family doctor',
                         phone_number: '380996603516', work_hours: '09:00 - 17:00'},
                         {name: 'Viktoria', surname: 'Brus', specialization: 'family doctor',
                          phone_number: '380503741154', work_hours: '09:00 - 17:00', photo_url:
                              'https://pervotsvit.kiev.ua/media/widgetkit/antonovska-ee9c7ac179fb5c34f39f5d2b0089b4cf.jpg'},
                         {name: 'Denis', surname: 'Pinchuk', specialization: 'family doctor',
                          phone_number: '380991552700', work_hours: '09:00 - 17:00', photo_url:
                              'https://clipart-db.ru/file_content/rastr/doctor-003.png'
                         }])

users = User.create([{email: 'user1@gmail.com', password: '123456', name: 'Tomy', surname: 'Anjelo',
                      birthday: '1939-07-10', phone_number: '380996775503'},
                     {email: 'user2@gmail.com', password: '123456', name: 'Jimm', surname: 'Klarck',
                      birthday: '1969-10-01', phone_number: '380971225344'}])

