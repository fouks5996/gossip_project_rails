class GossipsController < ApplicationController
   def index
      @gossips = Gossip.all.reorder(id: :asc, title: :asc, content: :asc)
    end

   def show
      @gossip = Gossip.find(params[:id])
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
      gossip_params = params.require(:gossip).permit(:title, :content)
      if @gossip.update(gossip_params)
        redirect_to action: "show", notice: 'Success', :id => @gossip.id
      else
        render :action => 'edit'
      end
    end



    # def gossip_params
    #   gossip_params = params.require(:gossip).permit(:title,:content)
  
    # end
end