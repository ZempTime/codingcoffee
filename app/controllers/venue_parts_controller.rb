class VenuePartsController < ApplicationController
  before_action :authenticate_user!, :set_venue

  STEPS = ['name', 'selection']

  def edit
    if step.present?
      render step
    else
      render nothing: true, status: 404
    end
  end

  def update
    if @venue.update venue_params
      if next_step
        redirect_to edit_venue_venue_part_path(@venue, next_step)
      else
        @venue.populate_from_factual
        redirect_to venue_path(@venue)
      end
    end
  end

  private

  def set_venue
    @venue = wizard_step_partner
  end

  def wizard_step_partner
    venue_class = "Venue::#{step.camelcase}".constantize rescue Venue
    venue_class.find(params[:venue_id])
  end

  def step
    STEPS.find { |a_step| a_step == params[:id].to_s.downcase }
  end

  def next_step
    current_step_index = STEPS.index(step)
    next_step = STEPS[current_step_index +1]
  end

  def venue_params
    params.require(:venue).permit(:name, :factual_id )
  end
end
