class GistQuestionService
  GITHUB_TOKEN = '7f31a58c6949008d3e84de22af34389f39ab2d28'

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: GITHUB_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.description', test: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content << @question.answers.pluck(:body)
    content.join("\n")
  end
end
