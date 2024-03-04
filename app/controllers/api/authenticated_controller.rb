module Api
  class AuthenticatedController < Api::BaseController
    class StudentNotAuthorized < StandardError
      def message
        I18n.t('users.errors.user_not_authorized')
      end
    end

    rescue_from Api::AuthenticatedController::StudentNotAuthorized, with: :user_not_authorized

    before_action :authorize

    private

    def student_not_authorized(exception)
      render_errors errors: [{ key: :student, messages: [exception.message] }], status: 401
    end

    def current_student
      student ||= Sudent.find_by(id: @current_student_id)
      raise Api::AuthenticatedController::UserNotAuthorized unless student

      user
    end

    def authorize
      subject = CheckAuthorize.run header: request.headers['Authorization']
      return render_resource_errors subject, status: :unauthorized unless subject.valid?

      @current_student_id = subject.result[:uid]
    end
  end
end