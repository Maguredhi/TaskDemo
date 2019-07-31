class TasksController < ApplicationController

  
  def index
    @tasks = Task.all 
  end

  def new
    @task = Task.new 
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = '新增成功'
      redirect_to '/tasks'
    else
      flash[:notice] = '新增失敗'
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
      redirect_to '/tasks', notice: "任務更新成功！"
      #失敗
      else
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy if @task
    redirect_to  '/tasks', notice: "任務已刪除！"
  end

  private
  def task_params
    params.require(:task).permit(:user_id, :title, :content, :priority)
  end
  
end
