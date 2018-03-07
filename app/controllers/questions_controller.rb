class QuestionsController < ApplicationController
  before_action :find_test

  def index
    render inline: "<% @test.questions.each do |question| %>
                      <p><%= question.body %></p>
                    <% end %>"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end
end
