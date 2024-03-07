# frozen_string_literal: true

class ClassRoom < ApplicationRecord
  belongs_to :school
  has_many :students, dependent: :destroy
end
