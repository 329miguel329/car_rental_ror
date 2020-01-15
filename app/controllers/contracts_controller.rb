class ContractsController < ApplicationController
  before_action :can_countinue!, unless: :json_request?
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "<i class='fa fa-home'></i> #{I18n.t("gui.menu.home")}".html_safe, :root_path

  # GET /contracts
  # GET /contracts.json
  def index
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.contract", count: 2)}".html_safe, contracts_path
    @contracts = Contract.all
    respond_to do |format|
      format.html
      format.json {
        render json: {head: :no_content}
      }
    end
  end

  # GET /contracts/new
  def new
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.contract", count: 2)}".html_safe, contracts_path
    add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.new")}".html_safe, new_contract_path
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.contract", count: 2)}".html_safe, contracts_path
    add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.edit")}".html_safe, edit_contract_path
  end

  # GET /contracts/1/show
  def show
    add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.contract", count: 2)}".html_safe, contracts_path
    add_breadcrumb "<i class='fa fa-th-list'></i> #{I18n.t("activerecord.models.contract", count: 1)}".html_safe, contract_path
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)
    respond_to do |format|
      if @contract.save
        format.html { redirect_to contracts_path, notice: (I18n.t 'activerecord.messages.contract.created') }
        format.json { render :show, status: :created, location: @contract }
      else
        add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.contract", count: 2)}".html_safe, contracts_path
        add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.new")}".html_safe, new_contract_path
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to contracts_path, notice: (I18n.t 'activerecord.messages.contract.updated') }
        format.json { render :show, status: :ok, location: @contract }
      else
        add_breadcrumb "<i class='fa fa-info-circle'></i> #{I18n.t("activerecord.models.contract", count: 2)}".html_safe, contracts_path
        add_breadcrumb "<i class='fa fa-pencil-square-o'></i> #{I18n.t("gui.actions.edit")}".html_safe, edit_contract_path
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    respond_to do |format|
      format.html {
        if @contract.destroy
          flash[:success] = I18n.t 'activerecord.messages.contract.destroyed'
        else
          flash[:danger] = I18n.t 'errors.messages.delete_association'
        end
        redirect_to contracts_url
      }
      format.json { head :no_content }
    end
  end

  # GET /contracts/select2
  def select2
    respond_to do |format|
      format.json {
        render json: Contract.select2(params_select2)
      }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:user_id, :passenger_id, :minute_time, :distance, :price, :origin, :destination)
    end

    def params_select2
      params.require(:select2).permit(:q)
    end

    def can_countinue
      unless can? action_name.to_sym, Contract
        flash[:danger] = I18n.t 'errors.messages.user_not_permission'
        redirect_to root_path and return
      end
    end
end
