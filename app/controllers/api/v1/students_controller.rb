module Api
  module V1
    class StudentsController < Api::BaseController
      def create
        subject = Students::CreateStudent.run student_params
        return render_resource_errors subject unless subject.valid?
        if subject.valid?
          render json: subject, status: :created


      end

      def destroy
      end

      private

      def student_params
        params.require(:student).permit(:id, :first_name, :last_name, :surname, :school_id, :class_id)
      end
    end
  end
end