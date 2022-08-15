class TasksController < ApplicationController
  skip_before_action :authenticate_request, only: %i[show index all_length all_tasks]

  def index
    a = params[:page].to_i
    @tasks = Task.where('user_id IS ?', nil).or(Task.where('user_id = ?',
    30)).order(created_at: :desc)[(a - 1) * 6...a * 6]
    pp @current_user
    render json: @tasks
  end

  def all_tasks
    a = params[:page].to_i
    @tasks = Task.order(created_at: :desc)[(a - 1) * 6...a * 6]
    pp @current_user
    render json: @tasks
  end

  def users_tasks_only
    a = params[:page].to_i
    @tasks = Task.where('user_id = ?', @current_user.id).order(created_at: :desc)[(a - 1) * 6...a * 6]
    pp @current_user
    render json: @tasks
  end


  def create
    task = Task.create(title: params[:title], text: params[:text], user: @current_user)
    if task.id.nil?
      render json: { errors: task.errors.full_messages }
    else
      render json: task, status: :created
    end
  end

  def show
    @task = Task.find(params[:id])
    render json: @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # render :json, status: :ok
    render json: @task
  end

  def update
    @task = Task.find(params[:id])
    @task.update(title: params[:title], text: params[:text], user: @current_user)
    render json: @task
  end

  def all_length
    count = Task.all
    render json: count.length
  end

  # def tasks_length
  #   count = Task.all
  #   render json: count.length
  # end

  def my_length
    count = Task.where('user_id = ?', @current_user.id)
    render json: count.length
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :text, :user_id)
  end
end
