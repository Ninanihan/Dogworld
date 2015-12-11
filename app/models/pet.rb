class Pet < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", :thumb => "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :user    # Association with User
  has_many :comments
  validates :nickname, presence: true, length: { maximum: 20}
  validates :age, presence: true
  validates :gender, presence: true
  validates :breeds, presence: true
  validates :city, presence: true
  
  
  

  
  
end
