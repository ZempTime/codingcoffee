class ReviewsController < ApplicationController
  before_action :set_venue
  before_action :set_review, except: [:new, :create]

  def new
    if current_user.reviews.where(venue_id: @venue.id).any?
      redirect_to edit_venue_review_path(@venue, current_user.reviews.where(venue_id: @venue.id).first)
    end
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
    @review.update review_params
    if @review.save
      redirect_to venue_path(@venue)
    else
      render "edit"
    end
  end

  def destroy
  end

  private
    def set_venue
      @venue = Venue.find(params[:venue_id])
    end

    def set_review
      @review = Review.find(params[:id])
      unless current_user.reviews.include?(@review)
        redirect_to :back, "You can only edit your own views"
      end
    end

    def review_params
      params.require(:review).permit(:user_id, :venue_id, :wifi_quality, :coffee_quality, :coffee_price, :chair_drag_loudness, :outlets_available, :temperature, :awesome_people, :comment)
    end
end
