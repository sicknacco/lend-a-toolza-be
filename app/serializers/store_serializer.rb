class StoreSerializer
  include JSONAPI::Serializer
  attributes :name, :formatted_address
end