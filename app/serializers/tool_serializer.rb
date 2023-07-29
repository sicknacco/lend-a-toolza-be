# frozen_string_literal: true

class ToolSerializer
  include JSONAPI::Serializer
  attributes :name,
             :description,
             :image,
             :status,
             :address,
             :user_id,
             :borrower_id
end
