class BadgeService
  RULES = {
    'all_tests_category' => :all_tests_category?,
    'all_tests_level' => :all_tests_level?,
    'test_first_time' => :test_first_time?
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
    @badges = Badge.all
  end

  def call
    @badges.each do |badge|
      method = RULES[badge.rule] || :default_method
      add_badge!(badge) if send(method, badge.rule_option)
    end
  end

  private

  def add_badge!(badge)
    @user.badges.push(badge)
  end

  def all_tests_category?(category)
    if @test.category.title == category && @test_passage.passed
      user_test_passed_count == Test.by_category(category).size
    end
  end

  def all_tests_level?(level)
    if @test.level == level.to_i && @test_passage.passed
      user_test_passed_count == Test.by_level(level.to_i).size
    end
  end

  def test_first_time?(test)
    if @test.title == test && @test_passage.passed
      @user.tests.where(title: test).size == 1
    end
  end

  def default_method(param)
    false
  end

  def user_test_passed_count
    @user.test_passages.test_passed.pluck(:test_id).uniq.size
  end
end
