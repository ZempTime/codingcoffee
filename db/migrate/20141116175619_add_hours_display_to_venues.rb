class AddHoursDisplayToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :hours_display, :string
  end
end
