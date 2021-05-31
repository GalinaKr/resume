class ResumeMailer < ApplicationMailer

  default :from => "resume.znpp@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.resume_mailer.send_resume.subject
  #
  def send_resume(pdf_output, to, user)
    report_filename = Time.zone.now.strftime("resume_#{user(user).full_name}_%d-%m-%Y.pdf")
    subject = "New Resume from #{user(user).full_name}"
    attachments[report_filename] = {
      :mime_type => 'application/pdf',
      :content => pdf_output
    }
    mail(:to => to, :subject => subject)
  end

  private

  def user(user)
    @user ||= User.find(user)
  end
end
