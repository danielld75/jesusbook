class User < ActiveRecord::Base
  has_one :babtism
  has_one :confirmation
  has_one :marriage
  has_one :priesthood
end
