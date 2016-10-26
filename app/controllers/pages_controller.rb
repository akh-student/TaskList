class PagesController < ApplicationController
  def index
    get_user
    if @user.nil?
      render pages_index_path
    else
      redirect_to tasks_path
    end
  end

  private
  def get_user
    if session[:user_id].nil?
      @user = nil
    else
      @user = User.find(session[:user_id]) # < recalls the value set in a previous request
    end
  end

end
