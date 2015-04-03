require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
  test "can get new signed in" do
    user = create(:user)
    sign_in user

    get :new
    assert_response :success
  end

  test "new redirect not signed in" do
    get :new
    assert_redirected_to new_user_session_path
  end

  test "can create signed in" do
    user = create(:user)
    sign_in user

    course = create(:course)
    assert course.valid?, "Should be able to create a course with user logged in"
  end

  test "create redirect not signed in" do
    assert_no_difference 'Course.count' do
      post :create, {:course => {
                     :name        => 'A course',
                     :description => 'Yup it is a course',
                     :cost        => 24.99
                     }
      }
    end

    assert_redirected_to new_user_session_path
  end

  test "unprocessable create invalid course" do
  user = create(:user)
  sign_in user

  post :create, {:course => {
                 :name        => 'A course',
                 :description => 'Yup it is a course'
                }
  }

  assert_response :unprocessable_entity
  end

  test "can get show signed in" do
    user = create(:user)
    sign_in user
    course = create(:course, :user_id => user.id)

    get :show, :id => course.id
    assert_response :success
  end

  test "redirect get show not signed in" do
    course = create(:course)

    get :show, :id => course.id
    assert_redirected_to new_user_session_path
  end

end
