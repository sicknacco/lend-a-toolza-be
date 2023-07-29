# frozen_string_literal: true

class StoreSerializer
  include JSONAPI::Serializer
  attributes :name, :formatted_address
end
