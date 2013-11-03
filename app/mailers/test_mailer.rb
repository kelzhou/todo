class TestMailer < ActionMailer::Base

  def tagged_message
    mail(
      :subject => 'hello',
      :to      => 'kelzhou3@gmail.com',
      :from    => 'leonard@bigbangtheory.com',
      :tag     => 'my-tag'
    )
  end

end