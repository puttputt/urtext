class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :description
      t.integer :type1
      t.integer :user_id
      t.integer :textbook_id
      t.integer :price
      t.timestamps
    end
  end

  def self.down
    drop_table :ads
  end
end
