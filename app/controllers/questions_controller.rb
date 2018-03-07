class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    render inline: "<% @test.questions.each do |question| %>
                      <p><%= question.body %></p>
                    <% end %>"
  end

  def show
    render inline: "<%= @question.body %>
                    <%= button_to 'Удалить', question_path, method: :delete %>"
  end

  def new; end

  def create
    Question.create(question_params)
    redirect_to test_questions_path
  end

  def destroy
    @question.destroy
    render plain: 'Вопрос удален.'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.permit(:body, :test_id)
  end

  def rescue_question_not_found
    render plain: 'Вопрос не найден.'
  end
end
