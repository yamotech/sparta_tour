class Course < ActiveRecord::Base
  has_many :participants
end
