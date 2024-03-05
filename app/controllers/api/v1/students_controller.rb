module Api
  module V1
    class StudentsController < Api::BaseController

      rescue_from ActiveRecord::RecordNotFound, with: :student_not_found

      def create
        subject = Students::CreateStudent.run student_params
        
        return render_resource_errors subject unless subject.valid?
        render_success subject.result, status: :created, token: token if subject.valid?
      end

      def destroy
        student = Student.find(params[:user_id])
        subject = Students::DestroyStudent.run student: student
        
        return render_resource_errors subject unless subject.valid?
        render_success 
      end      

      private

      def student_not_found
        render_errors errors: [{ key: :student, message: 'Некорректный id студента' }], status: 400
      end

      def token
        subject = CreateJwtToken.run student_params
        return render_resource_errors subject, status: :unauthorized unless subject.valid?
        { token: subject.result }
      end

      def student_params
        params.require(:student).permit(:id, :first_name, :last_name, :surname, :school_id, :class_room_id)
      end
    end
  end
end