class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def call
    Badge.find_each do |badge|
      method = "#{badge.rule}?"
      add_badge!(badge) if respond_to?(method, true) && send(method, badge.rule_option)
    end
  end

  private

  def add_badge!(badge)
    @user.badges.push(badge)
  end

  def all_tests_category?(category)
    @test.category.title == category && @test_passage.passed? &&
      user_test_passed_count == Test.by_category(category).size
  end

  def all_tests_level?(level)
    @test.level == level.to_i && @test_passage.passed? &&
      user_test_passed_count == Test.by_level(level.to_i).size
  end

  def test_first_time?(test)
    @test.title == test && @test_passage.passed? &&
      @user.tests.where(title: test).size == 1
  end

  def user_test_passed_count
    @user.test_passages.passed.pluck(:test_id).uniq.size
  end
end
