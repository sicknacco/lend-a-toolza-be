class Store
  attr_reader :name, 
              :formatted_address,
              :open_now

  def initialize(store_data)
    @name = store_data[:name]
    @formatted_address = store_data[:formatted_address]
    @open_now = store_data[:opening_hours][:open_now]
  end
end