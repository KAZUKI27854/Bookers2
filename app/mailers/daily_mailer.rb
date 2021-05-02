class DailyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_mailer.send_daily.subject
  #
  def send_daily
    @greeting = "Hi"
    mails = User.pluck(:email)
    mail to: mails, subject: 'Test complete!!'
  end
end
