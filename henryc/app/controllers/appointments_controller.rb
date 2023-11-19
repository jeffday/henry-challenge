class AppointmentsController < ApplicationController
  before_action :set_provider

  # GET /appointments or /appointments.json
  def index
    @appointments = Appointment.where(provider_id: @provider.id)

    respond_to do |format|
      format.json { render json: @appointments}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:provider_id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:provider_id)
    end
end
