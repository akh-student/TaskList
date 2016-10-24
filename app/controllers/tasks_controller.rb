class TasksController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    @tasks = @user.tasks
  end

  def create
    Task.create(title: params[:task][:title], description: params[:task][:description])
    go_home
  end

  def show
    @current_task = current_task
  end

  def new
  end

  def edit
    @current_task = current_task
  end

  def update
    @current_task = current_task

    if params[:title] != nil
      @current_task.title = params[:task][:title]
    end

    if params[:description] != nil
      @current_task.description = params[:task][:description]
    end

    if params[:complete] == 'true'
      @current_task.completed_at = Time.now
    elsif
      params[:complete] == 'false'
      @current_task.completed_at = nil
    end

    @current_task.save
    go_home
  end

  def destroy
    @current_task = current_task
    @current_task.destroy
    go_home
  end


private
  def go_home
    redirect_to action: 'index'
  end

  def find_user
    
  # I'm not sure if this is correct anymore
  def current_task
    Task.find(params[:id].to_i)
  end

end
