class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @goals = current_user.goals
  end

  def show
  end

  def new
    @goal = Goal.new
  end

  def edit
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.save

    respond_with @goal, location: -> { goals_path }
  end

  def update
    @goal.update(goal_params)
    respond_with @goal, location: -> { goals_path }
  end

  def destroy
    @goal.destroy
    respond_with @goal, location: -> { goals_path }
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(
      :name,
      :date,
      :image_keywords
    ).merge(
      user: current_user,
    )
  end
end
