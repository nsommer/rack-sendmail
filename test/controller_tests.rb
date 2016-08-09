require File.dirname(__FILE__) + '/test_helpers'
require 'rack'

class ControllerTests < Test::Unit::TestCase
  def setup
    @mock_request = Rack::MockRequest.new RackSendmail::Controller.new
  end

  def test_must_use_post_method
    response = @mock_request.get 'http://localhost:8080/'
    assert_equal response.status, 405
  end

  def test_must_contain_all_parameters
    # 'subject' is missing
    params = {'sender' => 'bob@example.org', 'message' => 'Hi'}
    response = @mock_request.post 'http://localhost:8080', {params: params}
    assert_equal response.status, 400
  end
end
