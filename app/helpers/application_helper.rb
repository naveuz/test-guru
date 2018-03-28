module ApplicationHelper
  ALERTS = { notice: 'success', alert: 'danger' }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def alert(type)
    ALERTS[type.to_sym]
  end
end
