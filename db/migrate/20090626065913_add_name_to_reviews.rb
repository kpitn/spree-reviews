class AddNameToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews,:name,:string,:limit=>70
  end

  def self.down
    remove_column :reviews,:name
  end
end
