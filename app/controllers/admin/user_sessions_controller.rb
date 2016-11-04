class Admin::UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = Admin::User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:admin_users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end
end
