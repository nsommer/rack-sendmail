module RackSendmail
  class << self
    attr_accessor :server, :port, :username, :password, :helo, :target_mail
  end

  # The address of the SMTP server.
  self.server = 'localhost'

  # The port the SMTP server listens at.
  self.port = 25

  # Username for optional authentication.
  self.username = nil

  # Password for optional authentication.
  self.password = nil

  # Hello source field of the SMTP request (should be the domain of the
  # host that runs the mailer).
  self.helo = 'localhost'

  # E-Mail address to send the e-mails to.
  self.target_mail = 'me@example.org'

  # Setup the mailer with the SMTP server data.
  #
  # Examples
  #
  #  RackSendmail.setup do |config|
  #     config.server = 'example.org'
  #     config.port = 25
  #  end
  def self.setup
    yield self
  end
end
