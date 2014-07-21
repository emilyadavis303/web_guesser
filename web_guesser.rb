require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => NUMBER, :message => message}
end

def check_guess(guess)
  if guess > NUMBER + 5
    message = "Way too high!"
  elsif guess < NUMBER - 5 && params['guess']
    message = "Way too low!"
  elsif guess < NUMBER && params['guess']
    message = "Too low!"
  elsif guess > NUMBER
    message = "Too high!"
  elsif guess == NUMBER
    message = "You got it right!"
  end
end
