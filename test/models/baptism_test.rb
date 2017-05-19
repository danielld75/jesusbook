require 'test_helper'

class BaptismTest < ActiveSupport::TestCase
  setup do
    @user = User.create(email: 'dan@op.pl', encrypted_password: 'iu3i4jju23902op3')
    @baptism = @user.build_baptism(parish: "Legnica", minister: "Bp Tadeusz")
    @baptism.save
  end
  test ""
end
