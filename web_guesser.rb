require 'sinatra'
require 'sinatra/reloader'

Secret_Number = rand(100)

def check_guess(guess)
  if guess.to_i > Secret_Number
    "You were too high"
  elsif guess.to_i < Secret_Number
    "You were too low"
  elsif guess.to_i == Secret_Number
    "You got it correct!!!"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => Secret_Number, :message => message}
end
