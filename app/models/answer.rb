class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true

  scope :correct_answers, -> { where(correct: true) }
end
