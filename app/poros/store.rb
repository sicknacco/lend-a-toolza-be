class Store
  attr_reader :name, 
              :formatted_address

  def initialize(store_data)
    @name = store_data[:name]
    @formatted_address = store_data[:formatted_address]
  end
end