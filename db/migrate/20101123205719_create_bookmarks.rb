class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.integer :ad_id, :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarks
  end
end
