require 'digest/md5'
class ChatsController < ApplicationController

	def index
		@chats = Chat.all
		@chat_listen_hash = Digest::MD5.hexdigest(current_user.email)
	end

	def create
		@chat = Chat.new(params[:chat])
		@chat.owner_id = current_user.id
		@chat_tokens = ChatToken.where(:owner_id => current_user).pluck(:token)
		@recipient = User.find(2)
		@hashed_token = Digest::MD5.hexdigest(current_user.email.to_s() + @recipient.email.to_s())
		if @chat_tokens.include? @hashed_token
		then
			@chat.recipient_ids = @recipient
			@chat.save
		else
			@chat_token = ChatToken.new
			@chat_token.token = @hashed_token
			@chat_token.owner_id = current_user.id
			@chat_token.recipient_id = @recipient.id
			@chat_token.save!
			@chat.recipient_ids = @recipient
			@chat.save
		end
		@chats = Chat.all
	end

end
