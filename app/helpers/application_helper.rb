module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_message(type, message)
    content_tag :p, message, class: type
  end
end
