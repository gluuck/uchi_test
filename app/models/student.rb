class Student < ApplicationRecord
  belongs_to :class
  belongs_to :school
end
