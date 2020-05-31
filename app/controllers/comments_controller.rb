class CommentsController < ApplicationController
before_action :require_user_logged_in
before_action :correct_user, only: [:destroy]

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
  def destroy
    @comment.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  def correct_user
  @comment = current_user.comments.find_by(id: params[:id])
  unless @comment
    redirect_to root_url
  end
  end
end
