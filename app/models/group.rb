class Group < ApplicationRecord
  has_many :members
  has_many :users, through: :members

  validates :name, presence: true, length: {minimum:3, maximum:15}, uniqueness: true 

end
