class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count

  scope :correct, -> { where(correct: true) }

  private

  def validate_count
    errors.add(:question) if question.answers.size > 4
  end
end
