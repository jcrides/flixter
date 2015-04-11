require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  # Disabled because no new action anymore, it's a modal now
  # test "new section with course" do
  #   user = create(:user)
  #   sign_in user
  #   course = create(:course, :user_id => user.id)
  #
  #   get :new, :course_id => course.id
  #   assert_response :success
  # end

  test "create section" do
    user = create(:user)
    sign_in user
    course = create(:course, :user_id => user.id)

    assert_difference 'course.sections.count' do
      post :create, :course_id => course.id, :section => { :title => 'A title is me' }
    end
  end

end
