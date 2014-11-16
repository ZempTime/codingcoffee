class RemoveFoursquareIdFromVenues < ActiveRecord::Migration
  def change
    remove_column :venues, :foursquare_id, :string
  end
end
