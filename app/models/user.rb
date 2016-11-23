class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :baptism, dependent: :destroy
  has_one :confirm_sacrament, dependent: :destroy
  has_one :marriage, dependent: :destroy
  has_one :priesthood, dependent: :destroy
  has_many :posts, dependent: :destroy

  accepts_nested_attributes_for :baptism

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
    url: "/assets/users/:id/:style/:basename.:extension",
    path: ":rails_root/public/assets/users/:id/:style/:basename.:extension",
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  after_create :create_baptism

  private
  def create_baptism
    Baptism.create(user_id: self.id, sacrament_date: self.baptism_date_user)
  end

end
