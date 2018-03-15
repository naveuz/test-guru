module TestPassagesHelper
  def result_passage(result)
    if @test_passage.passed?
      "<span style='color: green'>#{result}%</span>
      Тест успешно пройден".html_safe
    else
      "<span style='color: red'>#{result}%</span>
      Тест не пройден".html_safe
    end
  end
end
