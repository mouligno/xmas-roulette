class CreateUnofferings < ActiveRecord::Migration
  def change
    create_table :unofferings do |t|
      t.integer :user_offering_id
      t.integer :user_not_offering_to

      t.timestamps
    end
  end
end
