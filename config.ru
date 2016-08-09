$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__), 'config')
require 'rack-sendmail'
require 'setup'

run RackSendmail::Controller.new
