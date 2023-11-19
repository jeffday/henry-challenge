class OpeningsController < ApplicationController
  before_action :set_opening, only: %i[ show edit update destroy ]

  # GET /openings or /openings.json
  def index
    @openings = Opening.all
  end

  # GET /openings/1 or /openings/1.json
  def show
  end

  # GET /openings/new
  def new
    @opening = Opening.new
  end

  # GET /openings/1/edit
  def edit
  end

  # POST /openings or /openings.json
  def create
    @opening = Opening.new(opening_params)

    respond_to do |format|
      if @opening.save
        format.html { redirect_to opening_url(@opening), notice: "Opening was successfully created." }
        format.json { render :show, status: :created, location: @opening }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /openings/1 or /openings/1.json
  def update
    respond_to do |format|
      if @opening.update(opening_params)
        format.html { redirect_to opening_url(@opening), notice: "Opening was successfully updated." }
        format.json { render :show, status: :ok, location: @opening }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /openings/1 or /openings/1.json
  def destroy
    @opening.destroy!

    respond_to do |format|
      format.html { redirect_to openings_url, notice: "Opening was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opening
      @opening = Opening.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opening_params
      params.require(:opening).permit(:id, :date, :start, :end)
    end
end
