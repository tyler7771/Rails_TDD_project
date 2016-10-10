class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to user_url(@goal.user_id)
    else
      flash.now[:errors] = @goals.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    flash[:errors] = @goal.errors.full_messages
    redirect_to user_url(@goal.user_id)
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_url(@goal.user_id)
  end

  def show
    @goal = Goal.find(params[:id])
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :description, :private, :completed)
  end
end
