# frozen_string_literal: true

class Tool < ApplicationRecord
  validates :name,
            :description,
            :image,
            :status,
            :address,
            :user_id,
            :borrower_id, presence: true

  scope :search_by_name_and_state_or_zip, lambda { |name, location|
                                            where('name ILIKE ? AND address ILIKE ?', "%#{name}%", "%#{location}%")
                                          }
end
