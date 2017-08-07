require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => number}
end

def check_guess(guess)
  if guess > number
    "You were too high"
  elsif guess < number
    "You were too low"
  elsif guess == number
    "That was the number!!"
  end
end
