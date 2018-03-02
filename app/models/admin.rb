class Admin < ApplicationRecord
  has_many :tests

  validates :email, :password, presence: true
end
