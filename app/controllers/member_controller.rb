class MemberController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @members = User.all.page(1).per(10).order("created_at DESC")
  end

  def show
    @member = User.find(params[:id])
  end
end
