class FactualVenues
  require 'factual'
  require 'ostruct'

  @@client = Factual.new("Fd1rX71s1DGPCty647HGDnvvCvgT6bxGaaff4M8T", "6UKM5u033zunzDaO8GdOL1dzQ8yTPj6PwHUSfApF")

  def self.client
    @@client
  end

  def self.search_for(query:, around: "St. Louis")
    results = @@client.table("places-us").search(query).filters("locality" => around).rows
    turn_into_ostruct(results)
  end

  def self.turn_into_ostruct(array)
    all_results = []
    array.each { |result| all_results << OpenStruct.new(result) }
    all_results
  end

  def self.find(factual_id)
    result = [ @@client.table("places-us").row(factual_id) ]
    turn_into_ostruct(result).first
  end

end
