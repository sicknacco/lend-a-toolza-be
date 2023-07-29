class Api::V1::StoresController < ApplicationController
  def index
    store_facade = StoreFacade.new(params[:location], params[:radius])
    render json: StoreSerializer.new(store_facade.stores)
  end
end