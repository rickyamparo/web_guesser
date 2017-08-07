require 'sinatra'
require 'sinatra/reloader'

Secret_Number = rand(100)

def check_guess(guess)
  if guess.nil?
    "Please pick a number between 0 and 100"
  else
    if guess.to_i > Secret_Number
      "You were too high"
    elsif guess.to_i < Secret_Number
      "You were too low"
    elsif (guess.to_i - 5) > SECRET_NUMBER
      "That was way too high!"
    elsif (guess.to_i + 5) < SECRET_NUMBER
      "That was way too low!"
    elsif guess.to_i == Secret_Number
      "The Secret Number is #{Secret_Number}\nYou got it correct!!!"
    end
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => Secret_Number, :message => message}
end
