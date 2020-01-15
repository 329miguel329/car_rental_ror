class PassengersController < ApplicationController
  before_action :can_countinue
  before_action :set_passenger, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "<i class='fa fa-home'></i> #{I18n.t("gui.menu.home")}".html_safe, :root_path

  # GET /passengers
  # GET /passengers.json
  def index
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.passenger", count: 2)}".html_safe, passengers_path
    @passengers = Passenger.all
  end

  # GET /passengers/1
  # GET /passengers/1.json
  def show
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.passenger", count: 2)}".html_safe, passengers_path
    add_breadcrumb "<i class='fa fa-th-list'></i> #{I18n.t("activerecord.models.passenger", count: 1)}".html_safe, passenger_path
  end

  # GET /passengers/new
  def new
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.passenger", count: 2)}".html_safe, passengers_path
    add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.new")}".html_safe, new_passenger_path
    @passenger = Passenger.new
  end

  # GET /passengers/1/edit
  def edit
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.passenger", count: 2)}".html_safe, passengers_path
    add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.edit")}".html_safe, edit_passenger_path
  end

  # POST /passengers
  # POST /passengers.json
  def create
    @passenger = Passenger.new(passenger_params)
    respond_to do |format|
      if @passenger.save
        format.html { redirect_to passengers_path, notice: (I18n.t 'activerecord.messages.passenger.created') }
        format.json { render :show, status: :created, location: @passenger }
      else
        format.html { render :new }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passengers/1
  # PATCH/PUT /passengers/1.json
  def update
    respond_to do |format|
      if @passenger.update(passenger_params)
        format.html { redirect_to passengers_path, notice: (I18n.t 'activerecord.messages.passenger.updated') }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passengers/1
  # DELETE /passengers/1.json
  def destroy
    respond_to do |format|
      format.html {
        if @passenger.destroy
          flash[:success] = I18n.t 'activerecord.messages.passenger.destroyed'
        else
          flash[:danger] = I18n.t 'errors.messages.delete_association'
        end
        redirect_to passengers_url
      }
      format.json { head :no_content }
    end
  end

  # GET /passengers/select2
  def select2
    respond_to do |format|
      format.json {
        render json: Passenger.select2(params_select2)
      }
    end
  end

  # GET /passengers/get_passenger_by_identification
  def get_passenger_by_identification
    respond_to do |format|
      format.json {
        render json: Passenger.get_passenger_by_identification(passenger_by_identification_params)
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passenger_params
      params.require(:passenger).permit(:identification, :email, :phone)
    end

    def passenger_by_identification_params
      params.permit(:identification)
    end

    def params_select2
      params.require(:select2).permit(:q)
    end
    
    def can_countinue
      unless can? action_name.to_sym, Passenger
        flash[:danger] = I18n.t 'errors.messages.user_not_permission'
        redirect_to root_path and return
      end
    end
end
