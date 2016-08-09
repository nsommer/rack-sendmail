module RackSendmail
  # Public: Methods for sending email.
  class Mailer
    # Public: Send an email.
    #
    # message       - The String message of the email.
    # subject       - The String subject line of the email.
    # sender_mail   - The String representation of the email address of the sender.
    # receiver_mail - The String representation of the email address of the receiver.
    # sender_name   - The String containing the full name of the sender
    #                 (default is "").
    # receiver_name - The String containing the full name of the receiver
    #                 (default is "").
    #
    # Examples
    #
    #   send "Hi, don't forget the salad! Regards, Bob",
    #        "Dinner",
    #        "bob@example.org",
    #        "alice@example.org"
    #   #=>
    #
    # Returns nothing.
    def self.send(message, subject, sender_mail, receiver_mail, sender_name='', receiver_name='')
      request = <<MESSAGE_END
From: #{sender_name} <#{sender_mail}>
To: #{receiver_name} <#{receiver_mail}>
Subject: #{subject}

#{message}
MESSAGE_END

      Net::SMTP.start(RackSendmail.server,
                      RackSendmail.port,
                      RackSendmail.helo,
                      RackSendmail.username,
                      RackSendmail.password,
                      :plain) do |smtp|
        smtp.send_message request, sender_mail, receiver_mail
      end
    end
  end
end
