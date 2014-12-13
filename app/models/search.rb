class Search
  def self.execute(params)
    query = params[:query]
    facet = params[:facet] || "overall_rating"

    unless query
      facet_search(facet)
    else
      query_search(query)
    end
  end

  def self.facet_search(facet)
    Venue.search do
      order_by(facet.to_sym, :desc)
    end.results
  end

  def self.query_search(query)
    Venue.search do
      fulltext query
    end.results
  end
end
