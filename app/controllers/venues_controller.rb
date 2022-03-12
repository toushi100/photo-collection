class VenuesController < ApplicationController
  before_action :set_venue, only: %i[ show update destroy ]

  # GET /venues
  def index
    @venues = Venue.all

    render json: @venues, status: :ok
  end

  # GET /venues/1
  def show
    render json: @venue, status: :ok
  end

  # POST /venues
  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      render json: @venue, status: :created, location: @venue
    else
      render json: @venue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /venues/1
  def update
    if @venue.update(venue_params)
      render json: @venue, status: :ok
    else
      render json: @venue.errors, status: :not_modified
    end
  end

  # DELETE /venues/1
  def destroy
    @venue.destroy
    render json: {"message":"DELETED"}, status: :no_content

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venue_params
      params.require(:venue).permit(:name, :address)
    end
end
