module TestPassagesHelper
  def result_passage(result)
    if @test_passage.passed?
      content_tag(:span, "#{result}%.", style: "color: green") <<
        ' Тест успешно пройден.'
    else
      content_tag(:span, "#{result}%.", style: "color: red") <<
        ' Тест не пройден.'
    end
  end
end
