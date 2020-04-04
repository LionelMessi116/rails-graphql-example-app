# frozen_string_literal: true

module JWTWrapper

  EXPIRATION_HOURS = 24.hours
  # Just for test
  # SecureRandom.uuid
  SECRET_KEY = "730df807-74ff-430d-8fd5-dc9819c179a6"

  class << self
    def encode(payload)
      JWT.encode(payload, SECRET_KEY)
    end

    def decode(token)
      JWT.decode(token, SECRET_KEY)
    end

    def extract_user_from_headers(headers)
      decode_from_headers(headers).fmap { |payload| user_from_payload(payload) }.success
    end

    def generate_user_token(user)
      exp_time = EXPIRATION_HOURS

      payload = {
        user_id: user.id,
        user_name: user.name,
        exp: exp_time.from_now.to_i,
      }

      {
        value: encode(payload),
        expires: exp_time.from_now - 1.hours,
      }
    end

    private

    def decode_payload(token)
      payload = decode(token).first&.symbolize_keys
      valid_payload?(payload) ? M.Success(payload) : M.Failure('invalid payload')
    rescue JWT::DecodeError => err
      M.Failure(err.message)
    end

    def decode_from_headers(headers, key: 'Authorization')
      header = headers[key]
      return M.Failure('no authorization header') unless header

      strategy, token = header.split(' ')

      if strategy&.downcase == 'bearer'
        decode_payload(token)
      else
        M.Failure("wrong strategy: #{strategy}")
      end
    end

    def user_from_payload(payload)
      User.find_by(id: payload[:user_id])
    end

    def valid_payload?(payload)
      payload[:exp] && payload[:exp] > Time.current.to_i
    end
  end
end