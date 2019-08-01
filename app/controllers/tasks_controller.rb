class TasksController < ApplicationController
  before_action :task_params, only: [:create]

  
  def index
    @tasks = Task.all 
  end

  def new
    @task = Task.new 
  end

  def show
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, :alert => t('task.create_ok')
    else
      flash.now[:alert] = t('task.create_error')
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    
    if @task.update(task_params)
      #成功
      redirect_to tasks_path, notice: t('task.update_ok')
      #失敗
      else
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy if @task
    redirect_to tasks_path, notice: t('task.destroy_ok')
  end

  private
  def task_params
    params.require(:task).permit(:user_id, :title, :content, :priority)
  end
  
end
