class DashboardController < ApplicationController
  add_breadcrumb "<i class='fa fa-home'></i> #{I18n.t("gui.menu.home")}".html_safe, :root_path
  def index
    @contract = Contract.new()
  end

  def create_form
    oPassenger = Passenger.set_data_passenger(passenger_params)
    @contract = Contract.new({:user_id => current_user.id}.merge(contract_params))
    respond_to do |format|
      if oPassenger
        @contract.passenger_id = oPassenger.id
        if @contract.save
          format.html { redirect_to root_path, notice: (I18n.t 'activerecord.messages.contract.created') }
          format.json { render :show, status: :created, location: @contract }
        else
          format.html { render :create_form }
          format.json { render json: @contract.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :create_form }
        format.json { render json: oPassenger.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:user_id, :passenger_id, :minute_time, :distance, :price, :origin, :destination)
    end

    def passenger_params
      params.require(:passenger).permit(:identification, :email, :phone)
    end
end
