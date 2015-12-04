class Pet < ActiveRecord::Base
  
  belongs_to :user    # Association with User

  validates :nickname, presence: true, length: { maximum: 20}
  validates :age, presence: true
  validates :gender, presence: true
  validates :breeds, presence: true
  validates :city, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :owner_email, presence: true,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  
end
