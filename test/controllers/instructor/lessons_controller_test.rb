require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  test "should get new" do
    user = create(:user)
    sign_in user
    course = create(:course)
    section = create(:section, :course_id => course.id)

    get :new, :section_id => section.id
    assert_response :success
  end

  test "should get create" do
    user = create(:user)
    sign_in user
    course = create(:course)
    section = create(:section, :course_id => course.id)

    assert_difference 'section.lessons.count' do
      post :create, :section_id => section.id, :lesson => { :title => "This is a title",
                                                            :subtitle => "Subtitling"
                                                          }
    end
  end

end
