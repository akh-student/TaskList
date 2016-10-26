class TasksController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_action :find_user, except: [:index]


  def index
    if session[:user_id] == nil
      flash[:notice] = "Please log in"
      redirect_to '/'
    else
      find_user
      @tasks = @user.tasks
    end
  end

  def show
    @current_task = current_task
  end

  def new
  end

  def create
    @task = Task.new(title: params[:task][:title], description: params[:task][:description], user_id: @user.id)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @current_task = current_task
  end

  def update
    @current_task = current_task

    if params[:task][:title] != nil
      @current_task.title = params[:task][:title]
    end

    if params[:task][:description] != nil
      @current_task.description = params[:task][:description]
    end

    if params[:complete] == 'true'
      @current_task.completed_at = Time.now
    elsif
      params[:complete] == 'false'
      @current_task.completed_at = nil
    end

    @current_task.save
    redirect_to tasks_path
  end

  def destroy
    @current_task = current_task
    @current_task.destroy
    redirect_to tasks_path
  end


private
  def find_user
    @user = User.find(session[:user_id])
  end

  # I'm not sure if this is correct anymore
  def current_task
    Task.find(params[:id].to_i)
  end

end
