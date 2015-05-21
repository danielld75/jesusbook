class User < ActiveRecord::Base
  has_one :baptism, dependent: :destroy
  has_one :confirmation, dependent: :destroy
  has_one :marriage, dependent: :destroy
  has_one :priesthood, dependent: :destroy
end
