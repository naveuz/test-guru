class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, :password, presence: true

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test: test)
  end
end
