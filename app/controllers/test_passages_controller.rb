class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    flash_options = if result
                      create_gist!(result.html_url)
                      { notice: t('.success', url: result.html_url) }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @test_passage, flash_options
  end

  private

  def create_gist!(url)
    @test_passage.user.gists.create!(url: url, question: @test_passage.current_question)
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
