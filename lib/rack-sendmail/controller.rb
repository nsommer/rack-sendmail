module RackSendmail
  # Public: The controller that handles the HTTP requests.
  class Controller
    # Public: The handler method for Rack.
    def call(env)
      request = Rack::Request.new env

      return [
        '405',
        {'Content-Type' => 'application/json'},
        ['{ success: false, msg: "Only POST requests allowed." }']
      ] unless request.post?

      return [
        '400',
        {'Content-Type' => 'application/json'},
        ['{ success: false, msg: "Parameters incomplete." }']
      ] unless params_available? request

      RackSendmail::Mailer.send request.params['message'],
                                request.params['subject'],
                                request.params['sender'],
                                RackSendmail.target_mail,
                                sender_name(request)

      [
        '200',
        {'Content-Type' => 'application/json'},
        ['{ success: true, msg: "Mail sent to recipient." }']
      ]
    end

    private

      def params_available?(request)
        request.params.key?('message') &&
        request.params.key?('subject') &&
        request.params.key?('sender')
      end

      def sender_name(request)
        request.params['sender_name'] || ''
      end
  end
end
