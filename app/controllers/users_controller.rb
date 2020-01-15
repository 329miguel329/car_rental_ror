class UsersController < ApplicationController
  # GET /users/select2
  def select2
    respond_to do |format|
      format.json {
        render json: User.select2(params_select2)
      }
    end
  end

  private

    def params_select2
      params.require(:select2).permit(:q)
    end
end
