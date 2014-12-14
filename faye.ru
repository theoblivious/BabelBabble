# this starts the faye server

require 'faye'
bayeux = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
run bayeux
