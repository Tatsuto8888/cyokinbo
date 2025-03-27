class SavingsController < ApplicationController
  before_action :set_goal

  def create
    @saving = @goal.savings.build(saving_params)

    if @saving.save
      redirect_to @goal, notice: "貯金を登録しました！"
    else
      render "goals/show", status: :unprocessable_entity
    end
  end

  private

  def set_goal
    @goal = current_user.goals.find(params[:goal_id])
  end

  def saving_params
    params.require(:saving).permit(:amount)
  end
end
