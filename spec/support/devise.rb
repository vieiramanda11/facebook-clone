require_relative './controller_macros.rb'

RSpec.configure do |config|
    config.include Devise::Test::ControllerHelpers, :type => :controller

    config.extend ControllerMacros, :type => :controller
end