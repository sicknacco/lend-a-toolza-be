class Store
  attr_reader :name, 
              :formatted_address,
              :id

  def initialize(store_data)
    @name = store_data[:name]
    @formatted_address = store_data[:formatted_address]
    @id = store_data[:place_id]
  end
end