class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def show
  end

  def create
    @venue = Venue.create
    redirect_to edit_venue_venue_part_path(@venue, VenuePartsController::STEPS.first )
  end

end
