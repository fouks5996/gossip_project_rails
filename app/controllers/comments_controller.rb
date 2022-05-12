class CommentsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :destroy]

   def index
      @comments = Comment.all
    end

   def show
      @comment = Comment.find(params[:id])
      @gossip = Gossip.find(params[:id])
    end

    def new
      @comment = Comment.new
    end


    def create
      @comment = Comment.create(content: params[:content], user: current_user, gossip: Gossip.find(params[:gossip_id]))
      if @comment.save
         flash[:success] = "Le Commentaire à bien été crée" #Specifying a message when it succeeds
         redirect_to :controller => 'gossips', :action => 'show', :id => params[:gossip_id]
     else
         render 'gossips/new'
      end
      puts params
    end

    def edit
      puts params.inspect
      @gossip = Gossip.find(params[:gossip_id])
      @comment = Comment.find(params[:id])
    end


    def update
      @comment = Comment.find(params[:id]) 
      comment_params = params.require(:comment).permit(:content)
      if @comment.update(comment_params)
        flash[:success] = "Le Commentaire à bien été édité"
         redirect_to :controller => 'gossips', :action => 'show', :id => params[:gossip_id]
      else 
      render :action => 'edit'
      end
     end

     def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      flash[:success] = "Le Commentaire à bien été supprimé"
      redirect_to :controller => 'gossips', :action => 'show', :id => params[:gossip_id]
    end
end