module Students
  class DestroyStudent < ActiveInteraction::Base
    object :student

    def execute
      student.destroy
    end
  end
end