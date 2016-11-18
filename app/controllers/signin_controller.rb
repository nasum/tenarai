class SigninController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @signin = Signin.new
  end

  def create
    @signin = Signin.new(email: signin_params[:email], password: signin_params[:password])
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

  private

  def signin_params
    params.require(:signin).permit([:email, :password])
  end
end
