class StoreFacade

  def initialize(location, radius)
    @location = location
    @radius = radius
  end

  def stores
    @_stores ||= store_data.map do |store|
      Store.new(store)
    end
  end

  private
  
    def service 
      @_service ||= StoreService.new
    end

    def store_data
      @_store_data ||= service.get_store(@location, @radius)[:results]
    end
  end