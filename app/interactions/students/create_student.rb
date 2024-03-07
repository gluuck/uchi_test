# frozen_string_literal: true

module Students
  class CreateStudent < ActiveInteraction::Base
    string :first_name, :last_name, :surname, :school_id, :class_room_id

    validates :first_name, :last_name, :surname, :school_id, :class_room_id, presence: true

    def execute
      student = Student.new inputs
      errors.merge! student.errors unless student.save

      student
    end
  end
end
