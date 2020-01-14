class DashboardController < ApplicationController
  add_breadcrumb "<i class='fa fa-home'></i> #{I18n.t("gui.menu.home")}".html_safe, :root_path
  def index
    @contract = Contract.new({:user_id => current_user.id})
  end

  def create_form
  end
end
