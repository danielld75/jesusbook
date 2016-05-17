class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :baptism, dependent: :destroy
  has_one :confirm_sacrament, dependent: :destroy
  has_one :marriage, dependent: :destroy
  has_one :priesthood, dependent: :destroy

end
