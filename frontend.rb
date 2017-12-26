require 'Unirest'
require 'pp'

p "Welcome to my records store. Please pick an option."

p "[1] See all of my records"
p "[2] See a particular record"
p "[3] Create a new record option"

user_input = gets.chomp


if user_input == '1'
  p "See all of my records!"
  response = Unirest.get("localhost:3000/v1/records")
  records = response.body
  pp response.body
elsif user_input == '2'
  p "Enter an id to see a particular record."
  record_id = gets.chomp
  response = Unirest.get("localhost:3000/v1/records/#{record_id}")
  pp response.body
elsif user_input == '3'
  the_params = {}
  p "Enter the title"
  the_params[:title] = gets.chomp
  p "Enter the artist"
  the_params[:artist] = gets.chomp
  p "Enter the album year"
  the_params[:year] = gets.chomp.to_i
  p "Enter the price"
  the_params[:price] = gets.chomp.to_i
  response = Unirest.post("localhost:3000/v1/records", parameters: the_params)
  pp response.body
end