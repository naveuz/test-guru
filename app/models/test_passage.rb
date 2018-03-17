class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_question

  def success_percent
    self.correct_questions * 100 / question_count
  end

  def passed?
    success_percent >= 85
  end

  def question_count
    test.questions.size
  end

  def question_number
    question_count - next_questions.size
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  private

  def before_save_set_question
    self.current_question = if self.current_question.nil?
                              test.questions.first
                            else
                              next_question
                            end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def next_question
    next_questions.first
  end
end