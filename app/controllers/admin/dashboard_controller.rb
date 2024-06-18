class Admin::DashboardController < Admin::BaseController
  before_action :authenticate
  
  def index
    @users = User.all
  end
end
