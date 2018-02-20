class StaticPagesController < ApplicationController
  def about
    @link = 'http://www.thinknetica.com/'
  end

  def author
    @profile = 'https://github.com/naveuz'
  end
end
