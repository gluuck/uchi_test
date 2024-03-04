class School < ApplicationRecord
  has_many :classes, dependent: :destroy
  has_many :students, dependent: :destroy
end
