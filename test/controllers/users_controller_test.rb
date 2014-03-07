class UsersControllerTest < ActionController::TestCase
  test "should show user" do
    get(:show, {'id' => users(:valid_user).id})
    assert_response :success
  end

  test "should use users show template" do
    get(:show, {'id' => users(:valid_user).id})
    assert_template :show
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {name: "Elena Palmer", email: "example@exampleemail.com", 
                           password: "foobar", password_confirmation: "foobar"}
    end
    assert_redirected_to user_path(assigns(:user))
  end

end
