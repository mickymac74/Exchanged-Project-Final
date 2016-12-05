require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name:"john", email:"john@test.com")
  end

  test 'user should be valid' do
    assert @user.name.valid?
  end

  test 'user name should be present' do
      assert_not @user.name = ""
  end
  
  test 'email should be valid' do
      assert @user.email.valid?
  end
    
  test 'email should be present' do 
    assert_not @user.email = ""
  end
 
end