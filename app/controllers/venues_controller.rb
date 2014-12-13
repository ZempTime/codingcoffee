class VenuesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @venues = Venue.search do
      fulltext params[:query]
    end.results

    @hash = Gmaps4rails.build_markers(@venues) do |venue, marker|
      marker.lat venue.lat
      marker.lng venue.lng
      marker.infowindow venue.name
    end
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def create
    @venue = Venue.create
    redirect_to edit_venue_venue_part_path(@venue, VenuePartsController::STEPS.first )
  end

end
