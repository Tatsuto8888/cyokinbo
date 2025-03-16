class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :show ]  # ログイン必須

  def show
    @user = User.find(params[:id]) # 追記
  end
end
