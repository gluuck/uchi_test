class Student < ApplicationRecord
  belongs_to :class_room
  belongs_to :school
end
