class Stock < ApplicationRecord
    has_many :comments
    has_many :commenters, through: :comments, source: :user
    def feed_comments
        Comment.where(user_id: self.commenters, stock_id: self.id)
    end
end