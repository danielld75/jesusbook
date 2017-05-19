require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @u = User.create(name: "Kilo", email: "meksyk@poczta.pl", encrypted_password: "38oi893i")
  end
  test "create new user" do
    assert @u.name
    assert @u.email
    assert @u.encrypted_password
  end
  test "user can update data" do
    @u.update(name: "Lorem")
    assert_equal "Lorem", @u.name
  end
end
