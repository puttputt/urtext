class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :description
      t.integer :type, :user_id, :textbook_id
      t.decimal :price, :precision => "8", :scale => "2"
      t.timestamps
    end
  end

  def self.down
    drop_table :ads
  end
end
