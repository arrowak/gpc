class ChatsController < ApplicationController

	def index
		@chats = Chat.all
	end

	def create
		@chat = Chat.new(params[:chat])
		@chat.owner_id = current_user.id
		@chat.recipient_ids = nil
		@chat.save
		@chats = Chat.all
	end

end
