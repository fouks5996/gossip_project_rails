class GossipsController < ApplicationController
   before_action :authorize, only: [:new, :destroy]

   def index
      @gossips = Gossip.all.reorder(id: :asc, title: :asc, content: :asc)
    end

   def show
      @gossip = Gossip.find(params[:id])
      @comments = Comment.where('gossip_id': @gossip.id)
    end

    def new
      @gossip = Gossip.new
    end

    def create
      @gossip = Gossip.create(title: params[:title], content: params[:content], user: current_user)
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
      gossip_params = params.require(:gossip).permit(:title, :content)
      if @gossip.update(gossip_params)
        flash[:success] = "Le potin à bien été édité"
        redirect_to action: "show", notice: 'Success', :id => @gossip.id
      else
        render :action => 'edit'
      end
    end

    def destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      flash[:succes] = "Le potin à bien été supprimé"
      redirect_to gossips_path
    end

    # def like
    #   @gossip = Gossip.find(params[:id])
    #   Like.create(user: current_user, gossip: @gossip)
    #   redirect_to action: "show", notice: 'Success', :id => @gossip.id
    # end
end