class Product < ActiveRecord::Base
	belongs_to :user    # Association with User
  
  
  validates :breeds,:age, :gender,:city,:price, :description, presence: true
 
 has_attached_file :image, styles: { :medium => "400x400#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
end
