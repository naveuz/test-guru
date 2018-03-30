module GistsHelper
  def gist_hash(url)
    /\w{7,}/.match(url)
  end
end
