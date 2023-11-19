class OpeningsController < ApplicationController
  before_action :set_provider

  # GET /openings or /openings.json
  def index
    @openings = Opening.where({provider: @provider})
  end

  # POST /openings or /openings.json
  def create
    @opening = Opening.new(opening_params)

    respond_to do |format|
      if @opening.save
        format.json { render :show, status: :created, location: @opening }
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
      params.require(:opening).permit(:id, :date, :provider_id, :start, :end)
    end
end
