class ChatTokensController < ApplicationController
  # GET /chat_tokens
  # GET /chat_tokens.json
  def index
    @chat_tokens = ChatToken.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chat_tokens }
    end
  end

  # GET /chat_tokens/1
  # GET /chat_tokens/1.json
  def show
    @chat_token = ChatToken.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chat_token }
    end
  end

  # GET /chat_tokens/new
  # GET /chat_tokens/new.json
  def new
    @chat_token = ChatToken.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chat_token }
    end
  end

  # GET /chat_tokens/1/edit
  def edit
    @chat_token = ChatToken.find(params[:id])
  end

  # POST /chat_tokens
  # POST /chat_tokens.json
  def create
    @chat_token = ChatToken.new(params[:chat_token])

    respond_to do |format|
      if @chat_token.save
        format.html { redirect_to @chat_token, notice: 'Chat token was successfully created.' }
        format.json { render json: @chat_token, status: :created, location: @chat_token }
      else
        format.html { render action: "new" }
        format.json { render json: @chat_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chat_tokens/1
  # PUT /chat_tokens/1.json
  def update
    @chat_token = ChatToken.find(params[:id])

    respond_to do |format|
      if @chat_token.update_attributes(params[:chat_token])
        format.html { redirect_to @chat_token, notice: 'Chat token was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chat_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_tokens/1
  # DELETE /chat_tokens/1.json
  def destroy
    @chat_token = ChatToken.find(params[:id])
    @chat_token.destroy

    respond_to do |format|
      format.html { redirect_to chat_tokens_url }
      format.json { head :no_content }
    end
  end
end
