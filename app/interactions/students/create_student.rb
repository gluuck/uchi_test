module Student
  class CreateStudent < ActiveInteraction::Base
    string :first_name, :last_name, :surname, :school_id, :class_id

    validates :first_name, :last_name, :surname, :school_id, :class_id, presence: true

    def execute
      student = Student.new inputs
      errors.merge! student.errors unless student.save

      student
    end
  end
end
