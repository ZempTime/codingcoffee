class Venue < ActiveRecord::Base
  has_many :reviews

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
