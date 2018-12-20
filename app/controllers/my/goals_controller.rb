class My::GoalsController < ApplicationController

  before_action :authenticate_user!

  def index
    @goals = current_user.goals
  end

  def show
    @goal = current_user.goals.find(params[:id])
  end

  def new
    @goal = current_user.goals.new
    @goal.items.build
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      redirect_to [:my, @goal]
    else
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :goal_value, :unit_of_measure, items_attributes: [:item_value])
  end

end
