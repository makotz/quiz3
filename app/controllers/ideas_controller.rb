class IdeasController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      redirect_to idea_path(@idea), notice: "Idea created!"
    else
      render :new, alert: "Try again!"
    end
  end

  def edit
    @idea = Idea.find params[:id]
  end

  def update
    @idea = Idea.find params[:id]
    if @idea.update idea_params
      redirect_to idea_path(@idea), notice: "Idea updated!"
    else
      render :edit, alert: "Try again!"
    end
  end

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find params[:id]
    @owner = User.find @idea.user
    @likes = Like.where(idea_id: @idea).count
    @members = Member.where(idea_id: @idea)
  end

  def destroy
    @idea = Idea.find params[:id]
    @idea.destroy
    redirect_to root_path, notice: "Idea deleted!"
  end

  private

  def idea_params
    params.require(:idea).permit(:idea, :details)
  end

end
