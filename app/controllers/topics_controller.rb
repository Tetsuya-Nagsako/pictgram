class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users, :comment_users)
    @topics = @topics.order("takephoto DESC")
  end
  
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def destroy
    topic = Topic.find(params[:id])
    topic.destroy if topic.present?
    
    if topic.destroyed?
      redirect_to topics_path, success: "投稿したトピックを削除しました"
    else
      render("topics/edit", danger: "投稿したトピックの削除に失敗しました")
    end
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    @topic.image = topic_params[:image]
    @topic.description = topic_params[:description]
    @topic.takephoto = topic_params[:takephoto]
    
    if @topic.save
      redirect_to topics_path, success: "編集したトピックを投稿しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
  end
  
  
  
  private
  def topic_params
    params.require(:topic).permit(:image, :description, :takephoto)
  end
end