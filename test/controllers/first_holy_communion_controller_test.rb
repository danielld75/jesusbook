require 'test_helper'

class FirstHolyCommunionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get first_holy_communion_new_url
    assert_response :success
  end

  test "should get edit" do
    get first_holy_communion_edit_url
    assert_response :success
  end

  test "should get show" do
    get first_holy_communion_show_url
    assert_response :success
  end

end
