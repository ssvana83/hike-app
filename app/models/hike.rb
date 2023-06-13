class Hike < ActiveRecord::Base
  belongs_to :state
  # this is a macro
  # under the hood: self.belongs_to( :state)
  # this automatically gives us methods
  # belongs_to will only "work" if plants has a foreign key of "state_id"

end