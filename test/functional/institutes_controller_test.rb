require 'test_helper'

class InstitutesControllerTest < ActionController::TestCase
  setup do
    @institute = institutes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:institutes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create institute" do
    assert_difference('Institute.count') do
      post :create, institute: { address: @institute.address, city: @institute.city, contact_email: @institute.contact_email, contact_number: @institute.contact_number, contact_person: @institute.contact_person, name: @institute.name, year_estd: @institute.year_estd }
    end

    assert_redirected_to institute_path(assigns(:institute))
  end

  test "should show institute" do
    get :show, id: @institute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @institute
    assert_response :success
  end

  test "should update institute" do
    put :update, id: @institute, institute: { address: @institute.address, city: @institute.city, contact_email: @institute.contact_email, contact_number: @institute.contact_number, contact_person: @institute.contact_person, name: @institute.name, year_estd: @institute.year_estd }
    assert_redirected_to institute_path(assigns(:institute))
  end

  test "should destroy institute" do
    assert_difference('Institute.count', -1) do
      delete :destroy, id: @institute
    end

    assert_redirected_to institutes_path
  end
end
