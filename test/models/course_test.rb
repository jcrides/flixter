require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  test "create course" do
    course = create(:course)
    assert course.valid?, "should be able to create a course"
  end

end
