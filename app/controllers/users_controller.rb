# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update index]
  before_action :check_authorization, only: %i[edit update]
  before_action :set_user, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:danger] = 'Wrong date'
      render_to :edit
    end
  end

  private

  def check_authorization
    redirect_to root_path unless current_user.id == params[:id].to_i
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_pic)
  end
end
