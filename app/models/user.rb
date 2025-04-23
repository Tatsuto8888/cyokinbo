class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true # 追記

  validates :email, presence: true

  validates :password, presence: true, on: :create

  has_many :comments, dependent: :destroy

  has_many :goals, dependent: :destroy
  has_many :posts, dependent: :destroy
end
