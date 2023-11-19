class OpeningsController < ApplicationController
  before_action :set_provider

  # TODO: authentication so provider can only create appointments for themselves

  # POST /openings or /openings.json
  def create
    @opening = Opening.new(opening_params)

    respond_to do |format|
      if @opening.save
        @opening.create_appointments
        format.json { render json: {}, status: :created}
      else
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:provider_id])
    end

    # Only allow a list of trusted parameters through.
    def opening_params
      params.permit(:provider_id, :start, :end)
    end
end
