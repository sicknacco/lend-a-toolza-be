# frozen_string_literal: true

module Api
  module V1
    class ChatsController < ApplicationController
      def show
        project = params[:project]
        chat_service = ChatService.new
        tools = chat_service.get_tools(project)

        render json: { tools: }, status: :ok
      end
    end
  end
end
