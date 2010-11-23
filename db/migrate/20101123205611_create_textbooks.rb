class CreateTextbooks < ActiveRecord::Migration
  def self.up
    create_table :textbooks do |t|
      t.string :name, :author, :amazon_url
      t.integer :edition
      t.timestamps
    end
  end

  def self.down
    drop_table :textbooks
  end
end
