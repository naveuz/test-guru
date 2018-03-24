class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level }

  scope :by_level, ->(level) { where(level: level) }
  scope :easy_level, -> { by_level(0..1) }
  scope :medium_level, -> { by_level(2..4) }
  scope :hard_level, -> { by_level(5..Float::INFINITY) }
  scope :by_category, ->(category) { joins(:category)
                                    .where(categories: { title: category })
                                    .order('tests.title DESC') }

  def self.titles_of_category(title)
    by_category(title).pluck(:title)
  end
end
