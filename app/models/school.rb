# frozen_string_literal: true

class School < ApplicationRecord
  has_many :class_rooms, dependent: :destroy
  has_many :students, dependent: :destroy
end
