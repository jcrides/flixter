require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  test "should get new logged in" do
    user = create(:user)
    sign_in user
    course = create(:course, :user_id => user.id)
    section = create(:section, :course_id => course.id)

    get :new, :section_id => section.id
    assert_response :success
  end

  test "new lesson should fail not logged in" do
    user = create(:user)
    sign_in user
    course = create(:course)
    section = create(:section, :course_id => course.id)
    sign_out user

    get :new, :section_id => section.id
    assert_redirected_to new_user_session_path
  end

  test "new lesson unauthorized wrong user" do
    user = create(:user)
    sign_in user
    course = create(:course)
    section = create(:section, :course_id => course.id)
    sign_out user
    user2 = create(:user)
    sign_in user2

    get :new, :section_id => section.id
    assert_response :unauthorized
  end

  test "should get create logged in" do
    user = create(:user)
    sign_in user
    course = create(:course, :user_id => user.id)
    section = create(:section, :course_id => course.id)

    assert_difference 'section.lessons.count' do
      post :create, :section_id => section.id, :lesson => { :title => "This is a title",
                                                            :subtitle => "Subtitling"
                                                          }
    end
  end

  test "create should fail not logged in" do
    user = create(:user)
    sign_in user
    course = create(:course, :user_id => user.id)
    section = create(:section, :course_id => course.id)
    sign_out user

    assert_no_difference 'section.lessons.count' do
      post :create, :section_id => section.id, :lesson => { :title => "This is a title",
                                                            :subtitle => "Subtitling"
                  }
    end
  end

  test "create unauthorized wrong user" do
    user = create(:user)
    sign_in user
    course = create(:course, :user_id => user.id)
    section = create(:section, :course_id => course.id)
    sign_out user
    user2 = create(:user)
    sign_in user2

    post :create, :section_id => section.id, :lesson => { :title => "This is a title",
                                                          :subtitle => "Subtitling"
                }
    assert_response :unauthorized
  end

end
