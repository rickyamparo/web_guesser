require 'sinatra'
require 'sinatra/reloader'

Secret_Number = rand(100)

def check_color(message)
  if message.nil? ||
     message == "Please pick a number between 0 and 100"
    "#FFFFFF"
  else
    if message == "That was way too high!"
      "#FF0000"
    elsif message == "That was way too low!"
      "#FF0000"
    elsif message == "You were too high"
      "#FF9966"
    elsif message == "You were too low"
      "#FF9966"
    else
      "green"
    end
  end
end

def check_guess(guess)
  if guess.nil?
    "Please pick a number between 0 and 100"
  else
    if (guess.to_i - 5) > Secret_Number
      "That was way too high!"
    elsif (guess.to_i + 5) < Secret_Number
      "That was way too low!"
    elsif guess.to_i > Secret_Number
      "You were too high"
    elsif guess.to_i < Secret_Number
      "You were too low"
    elsif guess.to_i == Secret_Number
      "The Secret Number is #{Secret_Number}\nYou got it correct!!!"
    end
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color  = check_color(message)
  erb :index, :locals => {:number => Secret_Number,
                          :message => message,
                          :color => color}
end
