class CityController < ApplicationController
   def show
      @city = City.get_city(params[:id])
      @gossip = Gossip.all
    end
end