class UserController < ApplicationController
   def show
      @user = User.get_user(params[:id])
    end
end