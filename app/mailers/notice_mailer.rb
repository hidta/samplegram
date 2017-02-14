class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog
    @greeting = "Hi"

    mail to: "tahatwe6@gamil.com"
         subject: '写真が投稿されました'
  end
end
