class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :baptism, dependent: :destroy
  has_one :confirmation, dependent: :destroy
  has_one :marriage, dependent: :destroy
  has_one :priesthood, dependent: :destroy

  accepts_nested_attributes_for :baptism
end
