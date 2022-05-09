class IndexController < ApplicationController
  def home
    @gossips = Gossip.all
  end

  def user
    @user = User.get_user(params[:id])
  end

  def contact
  end

  def team
  end
end
