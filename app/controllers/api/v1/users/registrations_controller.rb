# frozen_string_literal: true

# app/controllers/api/v1/users/registrations_controller.rb
module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        respond_to :json

        private

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
