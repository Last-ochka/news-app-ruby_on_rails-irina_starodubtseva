class TasksController < ApplicationController

    # belongs_to :users


    def index
        @task = Task.new
        @tasks = Task.all.order(created_at: :desc)
        render json: @tasks    
    end
     
    def create
       @task = Task.new(tasks_params)
    @task.save      
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
            params.require(:task).permit(:title, :text)
        end
end
