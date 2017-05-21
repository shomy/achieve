class QuesController < ApplicationController
  def new
    if params[:back]
      @que = Que.new(ques_params)
    else
      @que = Que.new
    end
  end

  def confirm
    @que = Que.new(ques_params)
    render :new if @que.invalid?
  end

  def create
    @que = Que.new(ques_params)
    if @que.save
    redirect_to root_path,notice:"お問い合わせが完了しました！"
    else
    render 'new'
    end
  end

  private
  def ques_params
    params.require(:que).permit(:name, :email, :content)
  end
end