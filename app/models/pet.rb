class Pet < ActiveRecord::Base
  attr_accessible :nickname, :age, :gender, :breeds #can be accessible
  belongs_to :user    # Association with User

  validates :nickname, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :breeds, presence: true
  validates :user_id, presence: true
end
