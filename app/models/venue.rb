class Venue < ActiveRecord::Base
  has_many :reviews

  ATTRIBUTES = %w[wifi_quality coffee_quality coffee_price chair_drag_loudness outlets_available temperature]

  searchable do
    integer :wifi_quality
    integer :coffee_quality
    integer :coffee_price
    integer :chair_drag_loudness
    integer :outlets_available
    integer :temperature
    integer :overall_rating
    latlon(:location) { Sunspot::Util::Coordinates.new(lat, lng) }
    text :name
    text :awesome_people do
      reviews.pluck(:awesome_people)
    end
    text :comments do
      reviews.pluck(:comment)
    end
  end

  ATTRIBUTES.each do |attribute|
    define_method(attribute.to_sym) do
      aggregate_rating_for(attribute.to_s)
    end
  end

  def aggregate_rating_for(attribute)
    return 0 unless reviews.any?

    total = reviews.pluck(attribute.to_sym).compact.sum
    average = total.to_f / reviews.count
    average.round(0)
  end

  def overall_rating
    return 0 unless reviews.any?

    ratings = ATTRIBUTES.map {|attr| aggregate_rating_for(attr) }
    ratings.sum.to_f / ATTRIBUTES.length
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
