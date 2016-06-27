class MembersController < ApplicationController

  def create
    idea = Idea.find params[:idea_id]
    m = Member.new(idea: idea, user: current_user)
    if m.save
      redirect_to idea_path(idea), notice: "Joined as member!"
    else
      redirect_to idea_path(idea), alert: "Already member!"
    end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    m = Member.find params[:id]
    m.destroy if can? :destroy, Member
    redirect_to idea_path(idea), notice: "No longer member :("
  end

end
