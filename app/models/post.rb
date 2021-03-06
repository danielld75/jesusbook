class Post < ActiveRecord::Base
  belongs_to :user

  validates :body, presence: true,
                   length: {maximum: 200}

  scope :latest_post, ->  {order('created_at DESC')}

  has_attached_file :post_image, styles: {medium: "300x300>", thumb: "100x100", large: "800x800>" },
    url: "/assets/posts/:id/:style/:basename.:extension",
    path: ":rails_root/public/assets/posts/:id/:style/:basename.:extension",
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\Z/
end
