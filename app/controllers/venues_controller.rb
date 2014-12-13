class VenuesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @venues = Search.execute(params)

    @emphasis = params[:facet] || :overall_rating

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
