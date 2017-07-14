class SigthingsController < ApplicationController
  before_action :set_sigthing, only: [:show, :edit, :update, :destroy]

  # GET /sigthings
  # GET /sigthings.json
  def index
    # @sigthings = Sigthing.all
    @sigthings = Sigthing.where(date: params[:start_date]..params[:end_date]).
    where(region: params[:region])
render('sigthings/index.html.erb')
  end

  # GET /sigthings/1
  # GET /sigthings/1.json
  def show
  end

  # GET /sigthings/new
  def new
    @sigthing = Sigthing.new
    @animals_for_select = Animal.all.map do |animal|
      [animal.common_name, animal.id]
    end
  end

  # GET /sigthings/1/edit
  def edit
    @animals_for_select = Animal.all.map do |animal|
      [animal.common_name, animal.id]
    end
  end

  # POST /sigthings
  # POST /sigthings.json
  def create
    @sigthing = Sigthing.new(sigthing_params)

    respond_to do |format|
      if @sigthing.save
        format.html { redirect_to @sigthing, notice: 'Sigthing was successfully created.' }
        format.json { render :show, status: :created, location: @sigthing }
      else
        format.html { render :new }
        format.json { render json: @sigthing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sigthings/1
  # PATCH/PUT /sigthings/1.json
  def update
    respond_to do |format|
      if @sigthing.update(sigthing_params)
        format.html { redirect_to @sigthing, notice: 'Sigthing was successfully updated.' }
        format.json { render :show, status: :ok, location: @sigthing }
      else
        format.html { render :edit }
        format.json { render json: @sigthing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sigthings/1
  # DELETE /sigthings/1.json
  def destroy
    @sigthing.destroy
    respond_to do |format|
      format.html { redirect_to sigthings_url, notice: 'Sigthing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Puts the sigthings on the calendar
  def get_events

    @sigthing = Sigthing.all
    events = []
    @sigthing.each do |sigthing|
      events << { id: sigthing.id,
                  title: sigthing.region,
                  start: sigthing.date.to_s + " " + sigthing.time.strftime("%H:%M:%S").to_s,
                  url: Rails.application.routes.url_helpers.sigthing_path(sigthing.id)}
    end
    render :json => events.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sigthing
      @sigthing = Sigthing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sigthing_params
      params.require(:sigthing).permit(:date, :time, :region, :latitude, :longitude, :animal_id)
    end
end
