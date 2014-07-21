require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  background = @color
  erb :index, :locals => {:number => NUMBER, :message => message, :background => background}
end

def check_guess(guess)
  if guess > NUMBER + 5
    @color = 'red'
    message = "Way too high!"
  elsif guess < NUMBER - 5 && params['guess']
    @color = 'blue'
    message = "Way too low!"
  elsif guess < NUMBER && params['guess']
    @color = 'cyan'
    message = "Too low!"
  elsif guess > NUMBER
    @color = 'orange'
    message = "Too high!"
  elsif guess == NUMBER
    @color = 'green'
    message = "You got it right!"
  end
end
