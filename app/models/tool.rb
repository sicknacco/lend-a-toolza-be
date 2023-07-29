class Tool < ApplicationRecord
  validates :name, 
            :description, 
            :image, 
            :status, 
            :address, 
            :user_id, 
            :borrower_id, presence: true
end
