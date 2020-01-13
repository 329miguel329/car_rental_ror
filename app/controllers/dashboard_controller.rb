class DashboardController < ApplicationController
  add_breadcrumb "<i class='fa fa-home'></i> #{I18n.t("gui.menu.home")}".html_safe, :root_path
  def index
    @user = User.new({:rol => CarRental::ROL_PASSENGER})
  end

  def create_form
  end
end
