require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    user = users(:jesus)
    get login_path
    post login_path, params: { session: { email: user.email, password: 'password' } }
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  
end
