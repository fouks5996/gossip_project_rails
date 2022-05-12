class SessionsController < ApplicationController
   def new
    end
  
    def create
      user = User.find_by(email: params[:login][:email].downcase)
      if user && user.authenticate(params[:login][:password]) 
        session[:user_id] = user.id.to_s
        flash[:success] = "Connecté !"
        redirect_to '/gossips'
      else
        flash[:error] = "Mot de passe ou email incorrect, réessaye !"
        render :new
      end
    end
  
    def destroy
      # delete the saved user_id key/value from the cookie:
      session.delete(:user_id)
      redirect_to login_path, notice: "Logged out!"
    end
end
