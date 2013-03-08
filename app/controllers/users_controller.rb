# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
    authorize! :index, @users, :message => '没有足够的权限访问。'
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
    @micropost = current_user.microposts.build if user_signed_in?
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "用户删除成功"
    redirect_to users_path
  end
end
