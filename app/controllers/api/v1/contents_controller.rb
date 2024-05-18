# frozen_string_literal: true

# app/controllers/api/v1/contents_controller.rb
module Api
  module V1
    class ContentsController < ApplicationController
      before_action :authenticate_api_v1_user!
      before_action :set_content, only: [:show, :update, :destroy]
      before_action :authorize_user!, only: [:update, :destroy]

      def index
        contents = Content.all
        render json: contents, each_serializer: ContentSerializer
      end

      def show
        render json: @content, serializer: ContentSerializer
      end

      def create
        @content = current_api_v1_user.contents.build(content_params)
        if @content.save
          render json: @content, status: :created
        else
          render json: @content.errors, status: :unprocessable_entity
        end
      end

      def update
        if @content.update(content_params)
          render json: @content, serializer: ContentSerializer
        else
          render json: @content.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @content.destroy
        render json: { message: 'deleted' }, status: :ok
      end

      private

      def set_content
        @content = Content.find(params[:id])
      end

      def authorize_user!
        render json: { error: 'Not Authorized' }, status: :forbidden unless @content.user == current_user
      end

      def content_params
        params.require(:content).permit(:title, :body)
      end
    end
  end
end
