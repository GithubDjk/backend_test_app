# frozen_string_literal: true

#controller to authenticate signin using devise
module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: params[:email])
        if user && user.valid_password?(params[:password])
          sign_in(user) # Devise method to sign in the user
          render json: { message: 'Login successful', user: user }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end
    end
  end
end
