class CreateJwtToken < ActiveInteraction::Base
  SECRET_KEY = Rails.configuration.jwt_secret_key
  
  string :first_name
  validate :check_student

  def execute
    return unless @student

    encode
  end

  private

  attr_reader :invalid

  def check_student
    @student ||= Student.find_by(first_name: first_name)
    errors.add :invalid unless @student
  end

  def encode
    payload = { uid: @student.id, exp: Rails.configuration.jwt_token_expire_time.from_now.to_i }
    JWT.encode payload, SECRET_KEY, 'HS256'
  end
end