class ApplicationController < ActionController::API
  before_action :get_user
  private
  def get_user
    @user = User.find(params[:id])
  end

end
