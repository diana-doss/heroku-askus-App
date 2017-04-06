# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[:java, :javascript, :ruby, :android, :ios, :python, :php, :scala, :r, :c, :spring, :hibernate, :struts].each do |skill|
	Skill.create! name: skill.to_s, value: skill.to_s
end
