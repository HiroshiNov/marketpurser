class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :comments ,dependent: :destroy
  def post_comment(stock_instance,comment_params)
      self.comments.create(stock_id: stock_instance.id, content: comment_params)
  end

  has_many :watchlists ,dependent: :destroy
  has_many :watched_stocks, through: :watchlists,source: :stock
  
  def add_to_list(stock)
    self.watchlists.find_or_create_by(stock_id: stock.id)
  end
  def remove_from_list(stock)
    relationship = self.watchlists.find_by(stock_id: stock.id)
    relationship.destroy if relationship
  end
  
  def stock_exist?(stock)
    self.watched_stocks.include?(stock)
  end
end
