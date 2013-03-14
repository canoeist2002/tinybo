# -*- encoding : utf-8 -*-
class MicropostsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @microposts = current_user.feed.paginate(page: params[:page])
    @user = current_user
    @micropost = @user.microposts.build
  end

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "创建成功！"
      redirect_to current_user
    else
      redirect_to root_path
    end
  end

  def destroy
    @micropost = current_user.microposts.find_by_id(params[:id])
    @micropost.destroy
    redirect_to current_user
  end
end