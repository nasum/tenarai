class HomeController < ApplicationController
  skip_before_action :require_login, except: :index
  
  def index
  end
end
