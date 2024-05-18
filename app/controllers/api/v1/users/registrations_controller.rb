# frozen_string_literal: true

# app/controllers/api/v1/users/registrations_controller.rb
module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        respond_to :json

        private

        def respond_with(resource, _opts = {})
          register_success && return if resource.persisted?

          register_failed
        end

        def register_success
          render json: { message: 'Sign up successful', user: resource, token: current_token }, status: :ok
        end

        def register_failed
          render json: { message: 'Sign up failed', errors: resource.errors.full_messages }, status: :unprocessable_entity
        end

        def current_token
          request.env['warden-jwt_auth.token']
        end

        def sign_up_params
          params.require(:user).permit(:first_name, :last_name, :email, :password, :country)
        end

        def account_update_params
          params.require(:user).permit(:first_name, :last_name, :email, :password, :current_password, :country)
        end
      end
    end
  end
end
