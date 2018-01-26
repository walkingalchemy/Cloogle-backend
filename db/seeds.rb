# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
# require 'json'
# require 'nokogiri'

# doc = JSON.parse(Nokogiri::HTML(open("https://raw.githubusercontent.com/adambom/dictionary/master/dictionary.json")))
#
# doc.each do |word, definition|
#   Puzzle.create(word: word, hint: definition)
# end

# url = "https://raw.githubusercontent.com/doshea/nyt_crosswords/master/#{year}/#{month}/#{day}.json"


years = (1976..2010).to_a
months = ["01","02","03","04","05","06","07","08","09","10", "11", "12"]
days = ["01","02","03","04","05","06","07","08","09","10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"]

years.each do |year|
  months.each do |month|
    days.each do |day|
      url = "https://raw.githubusercontent.com/doshea/nyt_crosswords/master/#{year}/#{month}/#{day}.json"
      doc = JSON.parse(Nokogiri::HTML(open(url)))
      Board.create(board_url: url, title: doc["title"].split("NY TIMES, ").last )
    end
  end
end
