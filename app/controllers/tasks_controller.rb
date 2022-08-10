class TasksController < ApplicationController
  skip_before_action :authenticate_request, only: %i[show index]

  def index
    # @tasks = Task.all.order(created_at: :desc)
    # render json: @tasks
    #  if @current_user
    #    Task.where('user_id = ?', @current_user.id)
    #   #  .or(Task.where('user_id IS ?', nil))
    #  else

   ################# # @tasks = Task.where('user_id IS ?', nil)   !!!!
   
 ############ 
 @tasks = Task.all[0..params[:page]] 
 ##########       ?????????

    #  end
    pp @current_user
    # "title = ?", params[:title]
    render json: @tasks
  end

  def users_tasks
    # @tasks = Task.all.order(created_at: :desc)
    # render json: @tasks
    #  if @current_user
    @tasks = Task.where('user_id = ?', @current_user.id).or(Task.where('user_id IS ?', nil))
    #   #  .
    #  else
    #    Task.where('user_id IS ?', nil)
    #  end
    pp @current_user
    # "title = ?", params[:title]
    render json: @tasks
  end

  # def create
  #    @task = Task.new(tasks_params)
  # @task.save
  # end

  def create
    task = Task.create(title: params[:title], text: params[:text], user: @current_user)
    # @task = Task.new
    # @task.title = params[:title]
    # @task.text = params[:text]
    # @task.user = @current_user
    # pp @task
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
    render :json, status: :ok
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :text, :user_id)
  end
end
