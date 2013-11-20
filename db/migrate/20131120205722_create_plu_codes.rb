class CreatePluCodes < ActiveRecord::Migration
  def change
    create_table :plu_codes do |t|

      t.timestamps
    end
  end
end
