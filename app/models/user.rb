class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  before_save :before_save_email_downcase

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { whith: VALID_EMAIL },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test: test)
  end

  private

  def before_save_email_downcase
    email.downcase!
  end
end
