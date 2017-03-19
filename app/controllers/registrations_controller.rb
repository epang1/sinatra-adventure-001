class RegistrationsController < ApplicationController



  get '/register' do
    erb :register
  end

  post '/register' do
    session[:name] = params["name"]
    session[:email] = params["email"]
    session[:id] = 1
    redirect '/new'
  end


  get '/new' do
    throw Unauthorized unless user_registered?
    @email = session[:email]
    erb :new_user
  end
  # Bonus experience! The throw above makes an ugly error page happen.
  # Can you check for the same condition, but send them back to
  # the registration page with an error message that will tell
  # them what they've done wrong?

  def user_registered?
    if session[:id] != nil
      true
    else
      false
    end
  end

end
