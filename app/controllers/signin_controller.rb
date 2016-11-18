class SigninController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @signin = Signin.new
  end

  def create
    @signin = Signin.new(email: params[:email], password: params[:password])
    if @signin.valid? && @user = login(@signin.email, @signin.password)
      redirect_back_or_to(:dashboard_index, notice: 'Login successful')
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
