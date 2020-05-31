class CommentsController < ApplicationController
before_action :require_user_logged_in

  def create
    stock_insatnce = Stock.find(params[:stock_id])
    current_user.post_comment(stock_insatnce,comment_params[:content])
    flash[:success] = 'コメントを保存しました'
    redirect_to stock_insatnce
  end
  
  # def update
  #   stock_insatnce = Stock.find(params[:id])
  #   current_user.post_comment(stock_insatnce)
  #   flash[:success] = 'コメントを保存しました'
  #   redirect_to stock_insatnce
  # end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
