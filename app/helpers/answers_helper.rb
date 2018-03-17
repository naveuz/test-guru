module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      "Create New #{answer.question.body} Answer"
    else
      "Edit #{answer.question.body} Answer"
    end
  end
end
