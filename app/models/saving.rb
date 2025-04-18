class Saving < ApplicationRecord
  belongs_to :goal

  validates :amount, presence: { message: "を入力してください" },
                     numericality: { only_integer: true, message: "は半角数字で入力してください" }
end
