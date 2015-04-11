require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
  test "should get show" do
    user = create(:user)
    sign_in user

    get :show
    assert_response :success
  end

end
