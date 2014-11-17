class ReviewsController < ApplicationController
  before_action :set_venue

  def new
    @review = current_user.reviews.new
  end

  def edit
  end

  def create
    @review = current_user.reviews.new review_params
    if @review.save
      redirect_to venue_path(@venue)
    else
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  private
    def set_venue
      @venue = Venue.find(params[:venue_id])
    end

    def review_params
      params.require(:review).permit(:user_id, :venue_id, :wifi_quality, :coffee_quality, :coffee_price, :chair_drag_loudness, :outlets_available, :temperature, :awesome_people, :comment)
    end
end
