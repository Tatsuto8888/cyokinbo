class Saving < ApplicationRecord
  belongs_to :goal

  validates :amount, presence: { message: "目標金額を入力してください" },
                     numericality: { only_integer: true, message: "目標金額は半角数字で入力してください" },
                     format: { with: /\A[1-9][0-9]*\z/, message: "目標金額は半角数字のみ入力してください" }
end
