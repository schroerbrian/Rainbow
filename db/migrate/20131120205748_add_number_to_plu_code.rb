class AddNumberToPluCode < ActiveRecord::Migration
  def change
    add_column :plu_codes, :number, :integer
    add_column :plu_codes, :description, :string
    add_column :plu_codes, :flag, :integer
  end
end
