class Batch::DailyMail
  def self.daily_mail
    DailyMailer.send_daily.deliver_now
  end
end