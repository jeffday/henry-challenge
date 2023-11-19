class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ update destroy ]
  before_action :set_appointment, only: %i[ create ]
  before_action :set_client, only: %i[ create ]

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params_for_reserve)

    respond_to do |format|
      if @reservation.save!
        @appointment.taken = true
        
        if @appointment.save!
          format.json { render json: {}, status: :created}
        else
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      else
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update!(confirmed: Time.now)
        format.json { render json: {}, status: :ok}
      else
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy!

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

    def set_appointment
      @appointment = Appointment.find(params[:appointment_id])
    end

    def reservation_params_for_reserve
      {appointment_id: @appointment.id, client_id: @client.id}
    end
end
