class CommentsController < ApplicationController
  before_action :set_comment,only: [:destroy, :edit, :update]

  # コメントを保存、投稿するためのアクションです。
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    @notification = @comment.notifications.build(user_id: @blog.user.id)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js {render :index}
        unless @comment.blog.user_id == current_user.id
        Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'comment_created', {
          message: 'あなたの作成したブログにコメントが付きました'
        })
        end
        Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'notification_created', {
          unread_counts: Notification.where(user_id: @comment.blog.user.id, read: false).count
        })
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @blog = @comment.blog
  end

  def update
    @blog = @comment.blog
    if @comment.update(comment_params)
      redirect_to blog_path(@blog)
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js {render :index}
    end
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end
    def set_comment
      @comment = Comment.find(params[:id])
    end
end