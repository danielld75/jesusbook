class User < ActiveRecord::Base
  has_one :babtism, dependent: :destroy
  has_one :confirmation, dependent: :destroy
  has_one :marriage, dependent: :destroy
  has_one :priesthood, dependent: :destroy
end
