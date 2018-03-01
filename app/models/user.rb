class User < ApplicationRecord
  has_many :passing_tests
  has_many :tests, through: :passing_tests

  def tests_by_level(level)
    Test.joins('INNER JOIN passing_tests as pt ON pt.test_id = tests.id')
        .joins('INNER JOIN users ON pt.user_id = users.id')
        .where(users: { id: self.id }).where(tests: { level: level })
  end
end
