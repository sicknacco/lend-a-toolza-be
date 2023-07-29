# frozen_string_literal: true

class StoreFacade
  def initialize(location, radius)
    @location = location
    @radius = radius
  end

  def stores
    @stores ||= store_data.map do |store|
      Store.new(store)
    end
  end

  private

  def service
    @service ||= StoreService.new
  end

  def store_data
    @store_data ||= service.get_store(@location, @radius)[:results]
  end
end
