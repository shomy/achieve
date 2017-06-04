class XoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.xotice_mailer.sendmail_que.subject
  #
  def sendmail_que(que)
    @que = que


   mail(to: @que.email, subject: '【問い合わせ】が投稿されました')

  end
end