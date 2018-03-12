module ApplicationHelper
  def question_header(question)
    if question.new_record?
      "Create New #{question.test.title} Question"
    else
      "Edit #{question.test.title} Question"
    end
  end

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    render html: "<a href=\"https://github.com/#{author}/#{repo}\">
                    Test Guru
                  </a>".html_safe
  end
end
