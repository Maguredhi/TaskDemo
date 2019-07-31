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
      redirect_to tasks_path, :alert => "新增成功"
    else
      flash.now[:alert] = "新增失敗"
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
      redirect_to tasks_path, notice: "任務更新成功！"
      #失敗
      else
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy if @task
    redirect_to tasks_path, notice: "任務已刪除！"
  end

  private
  def task_params
    params.require(:task).permit(:user_id, :title, :content, :priority)
  end
  
end
