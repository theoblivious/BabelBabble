# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.foreach(File.join(Rails.root, 'db/random_questions.csv')) do |row|
  # chatroom_id = row[0].to_i
  question = row[1]
  answer = row[2]

  Quiz.create(chatroom_id: 1, question: question, answer: answer)


end
Chatroom.create(quiz_id: 1)

