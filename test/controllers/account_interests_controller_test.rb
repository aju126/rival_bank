require 'test_helper'

class AccountInterestsControllerTest < ActionController::TestCase
  setup do
    @account_interest = account_interests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_interests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_interest" do
    assert_difference('AccountInterest.count') do
      post :create, account_interest: { account_name: @account_interest.account_name, interest: @account_interest.interest }
    end

    assert_redirected_to account_interest_path(assigns(:account_interest))
  end

  test "should show account_interest" do
    get :show, id: @account_interest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_interest
    assert_response :success
  end

  test "should update account_interest" do
    patch :update, id: @account_interest, account_interest: { account_name: @account_interest.account_name, interest: @account_interest.interest }
    assert_redirected_to account_interest_path(assigns(:account_interest))
  end

  test "should destroy account_interest" do
    assert_difference('AccountInterest.count', -1) do
      delete :destroy, id: @account_interest
    end

    assert_redirected_to account_interests_path
  end
end
