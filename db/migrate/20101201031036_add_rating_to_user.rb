class AddRatingToUser < ActiveRecord::Migration
  def self.up
      change_table :users do |t|
        t.integer   :rating,              :default => 0
      end
  end

  def self.down
    remove_column :users, :rating
  end
end
