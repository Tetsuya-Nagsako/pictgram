class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users, :comment_users)
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
    topic = Topic.find(params[:topic_id])
    topic.destroy if topic.present?
    
    if topic.destroyed?
      redirect_to topics_path, success: "投稿したトピックを削除しました"
    else
      redirect_to topics_path, danger: "投稿したトピックの削除に失敗しました"
    end
  end
  

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end