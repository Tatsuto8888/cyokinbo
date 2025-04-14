class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :edit, :update ]
  before_action :set_user, only: [ :show, :edit, :update ]
  before_action :ensure_correct_user, only: [ :edit, :update ]

  def show
    @posts = @user.posts.includes(:user).order(created_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを更新しました。"
    else
      render :edit, alert: "更新に失敗しました。"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_correct_user
    unless current_user == @user
      redirect_to root_path, alert: "他のユーザーの編集はできません。"
    end
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :self_introduction, :goal_title)
  end
end
