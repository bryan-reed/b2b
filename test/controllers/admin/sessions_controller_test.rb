require 'test_helper'

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get admin_sessions_login_url
    assert_response :success
  end

end
