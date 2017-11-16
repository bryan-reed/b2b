require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name:"Bryan Reed", email:"bryan@reed.com")
  end
  # make sure a user model is valid
  test "should be valid" do
  	assert @user.valid?
  end
  test "name should be present" do
  	@user.name = "   "
  	assert_not @user.valid?
  end
  test "email should be present" do
  	@user.email = ""
  	assert_not @user.valid?
  end
end