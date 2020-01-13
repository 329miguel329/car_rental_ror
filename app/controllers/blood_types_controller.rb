class BloodTypesController < ApplicationController
  before_action :can_countinue
  before_action :set_blood_type, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "<i class='fa fa-home'></i> #{I18n.t("gui.menu.home")}".html_safe, :root_path

  # GET /blood_types
  # GET /blood_types.json
  def index
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.blood_type", count: 2)}".html_safe, blood_types_path
    @blood_types = BloodType.all
    respond_to do |format|
      format.html
      format.json {
        render json: {head: :no_content}
      }
    end
  end

  # GET /blood_types/new
  def new
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.blood_type", count: 2)}".html_safe, blood_types_path
    add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.new")}".html_safe, new_blood_type_path
    @blood_type = BloodType.new
  end

  # GET /blood_types/1/edit
  def edit
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.blood_type", count: 2)}".html_safe, blood_types_path
    add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.edit")}".html_safe, edit_blood_type_path
  end

  # GET /blood_types/1/show
  def show
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.blood_type", count: 2)}".html_safe, blood_types_path
    add_breadcrumb "<i class='fa fa-th-list'></i> #{I18n.t("activerecord.models.blood_type", count: 1)}".html_safe, blood_type_path
  end

  # POST /blood_types
  # POST /blood_types.json
  def create
    @blood_type = BloodType.new(blood_type_params)
    respond_to do |format|
      if @blood_type.save
        format.html { redirect_to blood_types_path, notice: (I18n.t 'activerecord.messages.blood_type.created') }
        format.json { render :show, status: :created, location: @blood_type }
      else
        add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.blood_type", count: 2)}".html_safe, blood_types_path
        add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.new")}".html_safe, new_blood_type_path
        format.html { render :new }
        format.json { render json: @blood_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blood_types/1
  # PATCH/PUT /blood_types/1.json
  def update
    respond_to do |format|
      if @blood_type.update(blood_type_params)
        format.html { redirect_to blood_types_path, notice: (I18n.t 'activerecord.messages.blood_type.updated') }
        format.json { render :show, status: :ok, location: @blood_type }
      else
        add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.blood_type", count: 2)}".html_safe, blood_types_path
        add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.edit")}".html_safe, edit_blood_type_path
        format.html { render :edit }
        format.json { render json: @blood_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blood_types/1
  # DELETE /blood_types/1.json
  def destroy
    respond_to do |format|
      format.html {
        if @blood_type.destroy
          flash[:success] = I18n.t 'activerecord.messages.blood_type.destroyed'
        else
          flash[:danger] = I18n.t 'errors.messages.delete_association'
        end
        redirect_to blood_types_url
      }
      format.json { head :no_content }
    end
  end

  # GET /blood_types/select2
  def select2
    respond_to do |format|
      format.json {
        render json: BloodType.select2(params_select2)
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blood_type
      @blood_type = BloodType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blood_type_params
      params.require(:blood_type).permit(:code, :name)
    end

    def params_select2
      params.require(:select2).permit(:q)
    end

    def can_countinue
      unless can? action_name.to_sym, BloodType
        flash[:danger] = I18n.t 'errors.messages.user_not_permission'
        redirect_to root_path and return
      end
    end
end
