class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
    @activity_types = ActivityType.all
    @markers_hash = Gmaps4rails.build_markers(@activities) do |activity, marker|
      marker.lat activity.latitude
      marker.lng activity.longitude
      marker.title activity.activity_type.title
      marker.infowindow '<strong>' + activity.activity_type.title + ': ' + activity.title + '</strong>' + '<br/>' + activity.description + '<br/>' + '<a href=' + activity_url(activity) + '>Открыть детали</a>'
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
    @activity_types = ActivityType.all
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.owner = User.create!(email: (0...8).map { ('a'..'z').to_a[rand(26)] }.join + '@aaa.bbb', password: '12345678')
    @activity_types = ActivityType.all

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Событие создано' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.fetch(:activity, {}).permit(:activity_type_id, :title, :address, :date_time, :duration_h, :duration_m, :description, :latitude, :longitude)
    end
end
