class FeedbacksMailer < ApplicationMailer
  before_action :find_admin

  def feedback(feedback)
    @user = feedback.user.email
    @subject = feedback.title
    @message = feedback.body

    mail to: @admin.email, subject: @subject
  end

  private

  def find_admin
    @admin = User.find_by(type: 'Admin')
  end
end
