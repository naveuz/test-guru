class Test < ApplicationRecord
  belongs_to :category
  belongs_to :admin
  has_many :questions
  has_many :passing_tests
  has_many :users, through: :passing_tests

  def self.titles_of_category(title)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: title })
        .order('tests.title DESC').pluck(:title)
  end
end
