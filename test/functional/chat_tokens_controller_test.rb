require 'test_helper'

class ChatTokensControllerTest < ActionController::TestCase
  setup do
    @chat_token = chat_tokens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chat_tokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chat_token" do
    assert_difference('ChatToken.count') do
      post :create, chat_token: { owner_id: @chat_token.owner_id, receipient_id: @chat_token.receipient_id, status: @chat_token.status, token: @chat_token.token }
    end

    assert_redirected_to chat_token_path(assigns(:chat_token))
  end

  test "should show chat_token" do
    get :show, id: @chat_token
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chat_token
    assert_response :success
  end

  test "should update chat_token" do
    put :update, id: @chat_token, chat_token: { owner_id: @chat_token.owner_id, receipient_id: @chat_token.receipient_id, status: @chat_token.status, token: @chat_token.token }
    assert_redirected_to chat_token_path(assigns(:chat_token))
  end

  test "should destroy chat_token" do
    assert_difference('ChatToken.count', -1) do
      delete :destroy, id: @chat_token
    end

    assert_redirected_to chat_tokens_path
  end
end
