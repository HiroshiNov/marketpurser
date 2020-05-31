class WatchlistsController < ApplicationController
 before_action :require_user_logged_in

  def create
    stock = Stock.find(params[:stock_id])
    current_user.add_to_list(stock)
    flash[:success] = 'Watch Listに登録しました'
    redirect_back(fallback_location: user_path(current_user))
  end

  def destroy
    stock = Stock.find(params[:stock_id])
    current_user.remove_from_list(stock)
    flash[:success] = 'Watch Listから削除しました。'
    redirect_back(fallback_location: user_path(current_user))
  end
end