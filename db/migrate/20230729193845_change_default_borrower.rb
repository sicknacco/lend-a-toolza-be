# frozen_string_literal: true

class ChangeDefaultBorrower < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tools, :borrower_id, default: nil
  end
end
