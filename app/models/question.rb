class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_answer_count

  private

  def validate_answer_count
    errors.add(:answers, 'Должно быть от 1 до 4') unless (1..4).cover?(answers.size)
  end
end
