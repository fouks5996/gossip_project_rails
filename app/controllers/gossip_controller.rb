class GossipController < ApplicationController
   def show
      @gossip = Gossip.get_gossip(params[:id])
    end
end