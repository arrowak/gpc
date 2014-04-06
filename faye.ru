require 'faye'
require File.expand_path('../config/initializers/faye_token.rb', __FILE__)
Faye::WebSocket.load_adapter('thin')

class ServerAuth
	def incoming(message, callback)
		if message['channel'] !~ %r{^/meta/}
			if !message['ext']['current_user_tokens'].include? message['ext']['auth_token']
				message['error'] = "Invalid Authentication Token"
			end
		end
		callback.call(message)
	end
end

faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
faye_server.add_extension(ServerAuth.new)
run faye_server