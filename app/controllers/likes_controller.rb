class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    idea = Idea.find params[:idea_id]
    l = Like.new(idea: idea, user: current_user)
    if l.save
      redirect_to idea_path(idea), notice: "Liked!"
    else
      redirect_to idea_path(idea), alert: "Already liked!"
    end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    l = Like.find params[:id]
    l.destroy if can? :destroy, Like
    redirect_to idea_path(idea), notice: "Unliked!"
  end

end
