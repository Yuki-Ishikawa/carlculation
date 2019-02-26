require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get user_index" do
    get admins_user_index_url
    assert_response :success
  end

end
