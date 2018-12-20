class My::ItemsController < ApplicationController

  before_action :authenticate_user!

  before_action :prepare_goal

  def new
    @item = @goal.items.build
  end

  def create
    @item = @goal.items.build(item_params)
    if @item.save
      redirect_to [:my, @goal]
    else
      render :new
    end
  end

  private

  def prepare_goal
    @goal = Goal.find(params[:goal_id])
  end

  def item_params
    params.require(:item).permit(:item_value)
  end

end
