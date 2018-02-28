class Test < ApplicationRecord
  def self.titles_of_category(title)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: title })
        .order('tests.title DESC').pluck(:title)
  end
end
