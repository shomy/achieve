class CommentsController < ApplicationController
  before_action :set_comment,only: [:destroy, :edit, :update]

  # コメントを保存、投稿するためのアクションです。
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js {render :index}
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