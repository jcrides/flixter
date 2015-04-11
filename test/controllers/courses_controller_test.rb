require 'test_helper'

class CoursesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index

    assert_response :success
  end

  # Disabling until I can get mocha working for stripe
  # test "show page as student or not log in" do
  #   course = create(:course)
  #   get :show, :id => course.id
  #
  #   assert_response :success
  # end
end
