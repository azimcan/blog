require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'test@test.com', password: '12345678')
  end

  test 'user should save' do 
    assert @user.save
  end

  test 'should not save user without email' do
    @user.email = nil
    assert_not @user.save, "can't be blank"
  end

  test 'should not save user without password' do
    @user.password = nil
    assert_not @user.save, "can't be blank"
  end

  # test 'should not be password is less than 8 character' do
  #   @user.password = '1234567'
  #   assert_not_equal(@user.password.size, 8)
  # end

end
