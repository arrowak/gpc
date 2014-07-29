require 'digest/md5'
class ChatsController < ApplicationController

	def index
		@chats = Chat.all
		@chat_listen_hash = Digest::MD5.hexdigest(current_user.email)
		@users = current_user.batch.users
	end

	def create
		@currentChats = params[:chat][:currentChats]
		Rails.logger.info("CURRENT CHATS : #{@currentChats}")
		params[:chat].delete :currentChats
		@chat = Chat.new(params[:chat])
		@chat_tokens = ChatToken.where(:owner_id => current_user).pluck(:token)
		@recipient = User.find(@currentChats)
		@hashed_token = Digest::MD5.hexdigest(current_user.email.to_s() + @recipient.email.to_s())
		if @chat_tokens.include? @hashed_token
		then
			@chat.token = ChatToken.find_by_token(@hashed_token)
			@chat_tokens = ChatToken.where(:owner_id => current_user).pluck(:token)
			@chat.save
		else
			@chat_token = ChatToken.new
			@chat_token.token = @hashed_token
			@chat_token.owner = current_user
			@chat_token.recipient = @recipient
			@chat_token.save!
			@chat.token = @chat_token
			@chat_tokens = ChatToken.where(:owner_id => current_user).pluck(:token)
			@chat.save
		end
		@chats = Chat.all
	end

end
