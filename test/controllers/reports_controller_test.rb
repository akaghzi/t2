require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get sumbycustomer" do
    get :sumbycustomer
    assert_response :success
  end

  test "should get sumbytime" do
    get :sumbytime
    assert_response :success
  end

  test "should get sumbycity" do
    get :sumbycity
    assert_response :success
  end

end
