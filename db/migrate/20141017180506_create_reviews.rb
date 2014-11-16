class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :venue_id
      t.integer :wifi_quality
      t.integer :coffee_quality
      t.integer :coffee_price
      t.integer :chair_drag_loudness
      t.integer :outlets_available
      t.integer :temperature
      t.string :awesome_people
      t.string :comment

      t.timestamps
    end
  end
end
