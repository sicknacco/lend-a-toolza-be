# frozen_string_literal: true

module Api
  module V1
    class ToolsController < ApplicationController
      def search
        result = Tool.find_by(name: params[:name], address: params[:location])
        if result
          render json: ToolSerializer.new(result), status: :ok
        else
          render json: { errors: 'No tools found' }, status: :not_found
        end
      end
    end
  end
end
