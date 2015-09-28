class NoticeMailer < ApplicationMailer
  default from: "nichenri1995@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_notice.subject
  #
  def sendmail_notice
    @over_borrowings = Borrowing.where(return_at < DateTime.now)

    mail to: "nichenri1995@gmail.com", subject: "Warining"
  end
end
