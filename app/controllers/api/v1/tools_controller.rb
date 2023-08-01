# frozen_string_literal: true

module Api
  module V1
    class ToolsController < ApplicationController
      def search
        result = Tool.find_by(name: params[:name], address: params[:location])
        if result
          render json: ToolSerializer.new(result), status: :ok
        else
          render json: { errors: 'No tools found in your area' }, status: :not_found
        end
      end

      def show
        tools = Tool.all_related_tools(params[:id])
        render json: ToolSerializer.new(tools), status: :ok
      end

      def create
       tool = Tool.create(tool_params)
       render json: ToolSerializer.new(tool), status: :created
      end

      private

      def tool_params
        params.require(:tool).permit(:name, :description, :image, :status, :address, :user_id, :borrower_id)
      end
    end
  end
end
