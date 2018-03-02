class Test < ApplicationRecord
  belongs_to :category
  belongs_to :admin
  has_many :questions
  has_many :passing_tests
  has_many :users, through: :passing_tests

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level }

  scope :by_level, ->(level) { where(level: level) }
  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }

  def self.titles_of_category(title)
    Test.joins(:category)
        .where(categories: { title: title })
        .order('tests.title DESC').pluck(:title)
  end
end
