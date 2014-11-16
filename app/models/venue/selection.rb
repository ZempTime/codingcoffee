class Venue::Selection < Venue

  def results
    FactualVenues.search_for(query: name)
  end
end
