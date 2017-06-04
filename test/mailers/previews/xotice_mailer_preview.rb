# Preview all emails at http://localhost:3000/rails/mailers/xotice_mailer
class XoticeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/xotice_mailer/sendmail_que
  def sendmail_que
    XoticeMailer.sendmail_que
  end

end
