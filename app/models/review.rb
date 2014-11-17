class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue

  validates :user_id, :venue_id, :wifi_quality, :coffee_quality, :coffee_price, :chair_drag_loudness, :outlets_available, :temperature, presence: true
  validates_inclusion_of :wifi_quality, :coffee_quality, :coffee_price, :chair_drag_loudness, :outlets_available, :temperature, :in => 1..3

  WIFI_QUALITY_SCALE = [ "terrible", "adequate", "awesome"]
  COFFEE_QUALITY_SCALE = ["icky", "adequate", "amazing"]
  COFFEE_PRICE_SCALE = ["pricy", "affordable", "marvelous"]
  CHAIR_DRAG_LOUDNESS_SCALE = ["earbleed city", "typical cafe", "symphonic silence"]
  OUTLETS_AVAILABLE_SCALE = ["no outlets", "some outlets", "bountiful outlets"]
  TEMPERATURE_SCALE = ["bring your wardrobe", "50/50", "always on point"]


  def generate_options(scale)
    result = {}
    scale.each_with_index do |k, i|
      result[k] = i+1
    end
    result
  end

end
