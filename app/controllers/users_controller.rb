class UsersController < ApplicationController
   def show
      @user = User.get_user(params[:id])
    end

   def new
      @user = User.new
   end

   def create
      @user = User.new(user_params)
      @user.email.downcase!
      
      if @user.save
      flash[:success] = "Compte crée avec succès !"
      redirect_to '/login'
      else
      flash[:error] = "Impossible de créer le compte, rééssaye avec un autre email"
      render :new
      end
   end

private

   def user_params
      params.require(:user).permit(:first_name, :last_name, :description, :age, :email, :city_id, :password, :password_confirmation)
   end
end