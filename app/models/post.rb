class Post < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  def save_tags(tag_names)
    tag_names.each do |name|
      tag = Tag.find_or_create_by(name: name)
      self.tags << tag
    end
  end
end
