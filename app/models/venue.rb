class Venue < ActiveRecord::Base
  has_many :reviews

  searchable do
    integer :wifi_quality do

    end
    integer :coffee_quality
    integer :coffee_price
    integer :chair_drag_loudness
    integer :outlets_available
    integer :temperature
    text :awesome_people
    text :comment
  end

  def wifi_quality
    reviews.pluck(:wifi_quality).compact
  end

  def populate_from_factual
    result = FactualVenues.find(factual_id)
    update(
      name: result.name,
      address: result.address,
      city: result.locality,
      lat: result.latitude,
      lng: result.longitude,
      country: result.country,
      website: result.website,
      phone: result.phone,
      zip: result.postcode,
      hours: result.hours,
      hours_display: result.hours_display,
      state: result.region,
      neighborhood: result.neighborhood
    )

    Venue.where(factual_id: factual_id).where.not(id: id).destroy_all
  end

  def display_address
    [address, city, state, zip].join(", ")
  end

end
