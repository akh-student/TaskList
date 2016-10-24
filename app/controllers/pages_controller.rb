class PagesController < ApplicationController
  def index
    if @user.nil?
    else
      redirect_to tasks
    end
  end

  private
  def get_user
    @user = User.find(session[:user_id]) # < recalls the value set in a previous request
  end

end
