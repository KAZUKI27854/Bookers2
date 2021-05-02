require 'test_helper'

class DailyMailerTest < ActionMailer::TestCase
  test "send_daily" do
    mail = DailyMailer.send_daily
    assert_equal "Send daily", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
