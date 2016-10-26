require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Validations" do
    assert users(:all_fields).valid?, "A user with all fields should be valid"
    assert users(:no_name).valid?, "A user with no name should be valid"
    assert_not users(:no_email).valid?, "A user with no email should not be valid"
    assert_not users(:no_uid).valid?, "A user with no uid should not be valid"
    assert_not users(:no_provider).valid?, "A user with no provider should not be valid"
  end

  test "Custom Model Methods" do
    auth_hash = {'info' => {'name' => 'Name', 'email' => 'email@emailaddress.com'}, uid: 8}
    newuser = User.build_from_github(auth_hash)
    assert_equal newuser.class, User
  end

  test "Model Relationships" do
    # Model has no relationships
  end

  # Write at least one test for each validation on a model
  # Write at least one test for each custom method on a model
  # Write at least one test for each model relationship on a model
  # Write at least one test for each scope on a model (we'll talk about scopes next week)
end
