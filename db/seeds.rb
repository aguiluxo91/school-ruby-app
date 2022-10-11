# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'


for i in 1..6
    group = Group.create(group_number: i)
end
    
10.times do
    for i in 1..6
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        Student.create(
            first_name: first_name,
            last_name: last_name,
            email: "#{first_name}.#{last_name}@example.com",
            password: "12345678",
            password_confirmation: "12345678",
            date_of_birth: Faker::Date.in_date_period(year: 2017 - i),
            group_id: i
        )
    end 
end


6.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    Teacher.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}.#{last_name}@example.com",
        password: "12345678",
        password_confirmation: "12345678",
    )
end
    

["Maths", "Biology", "Informatic", "Draw", "English", "Sport", "Spanish"].each do |subject|
    for i in 1..6 
        Subject.create(name: "#{subject} #{i}")
    end
end

