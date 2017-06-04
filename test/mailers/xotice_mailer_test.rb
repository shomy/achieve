require 'test_helper'

class XoticeMailerTest < ActionMailer::TestCase
  test "sendmail_que" do
    mail = XoticeMailer.sendmail_que
    assert_equal "Sendmail que", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
