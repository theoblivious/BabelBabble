# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

require 'faye'
bayeux = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
run bayeux
