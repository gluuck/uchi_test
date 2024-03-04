class Class < ApplicationRecord
  belongs_to :school, class_name: "school", foreign_key: "school_id"
  has_many :students, dependent: :destroy
end
