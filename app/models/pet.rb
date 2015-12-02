class Pet < ActiveRecord::Base
  
  belongs_to :user    # Association with User

  validates :nickname, presence: true, length: { maximum: 20}
  validates :age, presence: true
  validates :gender, presence: true
  validates :breeds, presence: true
  
end
