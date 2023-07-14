class State < ActiveRecord::Base
  has_many :hikes, dependent: :destroy
  # whenever you destroy a state, also destroy all related info
  # validations that come with AR
  # validates :statename, presence: true
  # validates :townname, presence: true, uniqueness: true
end

# hikes.delete is a method now with inheritance
