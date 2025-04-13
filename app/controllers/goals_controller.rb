class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: [ :show, :edit, :update, :destroy ]

  def index
    @goals = current_user.goals.includes(:savings)
  end

  def show
  end

  def new
    @goal = current_user.goals.new
  end

  def create
    @goal = current_user.goals.build(goal_params)

    if @goal.save
      redirect_to @goal, notice: "目標を作成しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path, notice: "タイトルを更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_path, notice: "目標を削除しました！"
  end

  private

  def set_goal
    @goal = current_user.goals.find_by(id: params[:id])
    redirect_to root_path, alert: "この目標にはアクセスできません。" unless @goal
  end

  def goal_params
    params.require(:goal).permit(:title, :target_amount)
  end
end
