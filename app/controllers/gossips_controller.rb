class GossipsController < ApplicationController
   def index
      @gossips = Gossip.all
    end

   def show
      @gossip = Gossip.get_gossip(params[:id])
    end

    def new
      @gossip = Gossip.new
    end

    def create
      @gossip = Gossip.create(title: params[:title], content: params[:content], user: User.find(1.freeze))
      if @gossip.save
         flash[:success] = "Le potin à bien été crée" #Specifying a message when it succeeds
         redirect_to gossips_path
     else
         render 'gossips/new'
      end
      puts params
    end


    def edit 
      @gossip = Gossip.find(params[:id])
    end

    def update
      @gossip = Gossip.find(params[:id])
      @gossip.update(title: params[:title], content: params[:content])
      redirect_to gossips_path
    end
end