# frozen_string_literal: true

class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :status
      t.integer :user_id
      t.string :address
      t.integer :borrower_id

      t.timestamps
    end
  end
end
