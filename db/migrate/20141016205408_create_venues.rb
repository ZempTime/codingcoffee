class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :foursquare_id
      t.float :lat
      t.float :lng
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :hours

      t.timestamps
    end
  end
end
