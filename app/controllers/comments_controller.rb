class CommentsController < ApplicationController
  def new
    @comment = Comment.new 
    @comment.topic_id = params[:topic_id]
  end
  
  def create
    @comment = current_user.comments.new(comment_paramas)
    
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = 'コメント投稿に失敗しました'
      render :new
    end
  end
  
  def destroy
    comment = Comment.find(params[:comment_id])
    comment.destroy if comment.present?
    
    if comment.destroyed?
      redirect_to topics_path, success: "コメントを削除しました"
    else
      redirect_to topics_path, danger: "コメント削除に失敗しました"
    end
  end
  
  private
  def comment_paramas
    params.require(:comment).permit(:comment, :topic_id, :comment_id)
  end
end