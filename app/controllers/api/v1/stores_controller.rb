# frozen_string_literal: true

module Api
  module V1
    class StoresController < ApplicationController
      def index
        store_facade = StoreFacade.new(params[:location], params[:radius])
        render json: StoreSerializer.new(store_facade.stores)
      end
    end
  end
end
