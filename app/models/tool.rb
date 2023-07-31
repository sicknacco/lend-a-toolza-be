# frozen_string_literal: true

class Tool < ApplicationRecord
  validates :name,
            :description,
            :image,
            :status,
            :address,
            :user_id, presence: true
             
  validates :borrower_id, presence: true, allow_nil: true

  scope :search_by_name_and_state_or_zip, lambda { |name, location|
                                            where('name ILIKE ? AND address ILIKE ?', "%#{name}%", "%#{location}%")
                                          }
end
