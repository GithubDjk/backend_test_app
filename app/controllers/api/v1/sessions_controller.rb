# frozen_string_literal: true

#controller to authenticate signin using devise
module Api
  module V1
    class SessionsController < Devise::SessionsController
      def create
        user = User.find_by(email: session_params[:email])
        if user && user.valid_password?(session_params[:password])
          token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
          render json: { data: UserSerializer.new(user, token: token)}, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      private

      def session_params
        params.require(:session).require(:user).permit(:email, :password)
      end
    end
  end
end
