require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  test "get show lesson student" do
    course = create(:course)
    section = create(:section, :course_id => course.id)
    lesson = create(:lesson, :section_id => section.id)
    user = create(:user)
    sign_in user
    enrollment = create(:enrollment, :user_id => user.id, :course_id => course.id)

    get :show, :id => lesson.id
    assert_response :success
  end

end
