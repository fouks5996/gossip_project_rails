class LikesController < ApplicationController
   before_action :find_gossip
   before_action :find_like, only: [:destroy]

   def create
     if already_liked?
      flash[:notice] = "You can't like more than once"
     else
      puts "succes"
       @liked = Like.create(user_id: current_user.id, gossip_id: params[:gossip_id])
       @liked.save
     end
      redirect_to gossip_path(@gossip)
   end

   def destroy
      if !(already_liked?)
        flash[:notice] = "Cannot unlike"
      else
        @like.destroy
      end
      redirect_to gossip_path(@gossip)
   end    


   private
   def find_gossip
     @gossip = Gossip.find(params[:gossip_id])
   end

   def find_like
      @like = @gossip.likes.find(params[:id])
   end

   def already_liked?
      Like.where(user_id: current_user.id, gossip_id: params[:gossip_id]).exists?
    end
end
