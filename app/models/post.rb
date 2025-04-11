class Post < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true
  validates :body, presence: true
end
