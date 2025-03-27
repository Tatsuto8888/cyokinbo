class Goal < ApplicationRecord
  belongs_to :user
  has_many :savings, dependent: :destroy # 親モデルが削除されるときに子モデル（saving）も削除される

  # 残りの金額を動的に計算
  def remaining_amount
    target_amount - total_savings
  end

  # 合計貯金額を計算
  def total_savings
    savings.sum(:amount)
  end

  validates :title, presence: { message: "タイトルを入力してください" }
  validates :target_amount, presence: { message: "目標金額を入力してください" },
                            numericality: { only_integer: true, message: "目標金額は半角数字で入力してください" },
                            format: { with: /\A[0-9]+\z/, message: "目標金額は半角数字のみ入力してください" }
end
