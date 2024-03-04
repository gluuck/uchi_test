class CreateJwtToken < ActiveInteraction::Base
  SECRET_KEY = Rails.configuration.jwt_secret_key

  object :student

  validate :check_student

  def execute
    return unless @student

    encode
  end

  private

  attr_reader :invalid

  def check_student
    @student ||= Student.find_by(id: student.id)
    errors.add :invalid unless @student
  end

  def encode
    payload = { uid: @student.id, exp: Rails.configuration.jwt_token_expire_time.from_now.to_i }
    JWT.encode payload, SECRET_KEY, 'HS256'
  end
end