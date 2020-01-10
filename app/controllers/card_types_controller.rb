class CardTypesController < ApplicationController
  add_breadcrumb "<i class='fa fa-home'></i> #{I18n.t("gui.menu.home")}".html_safe, :root_path

  # GET /card_types
  # GET /card_types.json
  def index
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.card_type", count: 2)}".html_safe, card_types_path
    @card_types = CardType.all
    respond_to do |format|
      format.html
      format.json {
        if params.has_key?(:select2)
          render json: CardType.select2(params_select2)
        else
          render json: CardTypeDatatable.new(view_context)
        end
      }
    end
  end

  # GET /card_types/new
  def new
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.card_type", count: 2)}".html_safe, card_types_path
    add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.new")}".html_safe, new_card_type_path
    @card_type = CardType.new
  end

  # GET /card_types/1/edit
  def edit
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.card_type", count: 2)}".html_safe, card_types_path
    add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.edit")}".html_safe, edit_card_type_path
  end

  # POST /card_types
  # POST /card_types.json
  def create
    @card_type = CardType.new(card_type_params)
    respond_to do |format|
      if @card_type.save
        format.html { redirect_to card_types_path, notice: (I18n.t 'activerecord.messages.card_type.created') }
        format.json { render :show, status: :created, location: @card_type }
      else
        format.html { render :new }
        format.json { render json: @card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_types/1
  # PATCH/PUT /card_types/1.json
  def update
    respond_to do |format|
      if @card_type.update(card_type_params)
        format.html { redirect_to card_types_path, notice: (I18n.t 'activerecord.messages.card_type.updated') }
        format.json { render :show, status: :ok, location: @card_type }
      else
        format.html { render :edit }
        format.json { render json: @card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_types/1
  # DELETE /card_types/1.json
  def destroy
    respond_to do |format|
      format.html {
        if @card_type.destroy
          flash[:success] = I18n.t 'activerecord.messages.card_type.destroyed'
        else
          flash[:danger] = I18n.t 'errors.messages.delete_association'
        end
        redirect_to card_types_url
      }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card_type
    @card_type = CardType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def card_type_params
    params.require(:card_type).permit(:code, :name)
  end

  def params_select2
    params.require(:select2).permit(:code, :name)
  end
end
