class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = '新增成功'
      redirect_to '/tasks'
    else
      flash[:notice] = '新增失敗'
      render :new
    end
  end

  def edit
    @tag = Tag.find_by(id: params[:id])
  end

  def update
    @tag = Tag.find_by(id: params[:id])
    
    if @tag.update(tag_params)
      #成功
      redirect_to '/tasks', notice: "標籤更新成功！"
      #失敗
      else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find_by(id: params[:id])
    @tag.destroy if @tag
    redirect_to  '/tasks', notice: "標籤已刪除！"
  end

  private
  def tag_params
    params.require(:tag).permit(:label)
  end
  
end
