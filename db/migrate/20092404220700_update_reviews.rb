class UpdateReviews < ActiveRecord::Migration
  def self.up
    remove_column :reviews, :name
    remove_column :reviews, :location
    add_column :reviews, :user_id, :integer
  end

  def self.down
    add_column :reviews, :string
    add_column :reviews, :string
    remove_column :reviews, :user_id
  end
end
