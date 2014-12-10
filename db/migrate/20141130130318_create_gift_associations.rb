class CreateGiftAssociations < ActiveRecord::Migration
  def change
    create_table :gift_associations do |t|
      t.integer :user_offering_id
      t.integer :user_receiving_id
      t.string :gift_theme

      t.timestamps
    end
  end
end
