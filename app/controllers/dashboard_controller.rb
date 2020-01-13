class DashboardController < ApplicationController
  add_breadcrumb "<i class='fa fa-home'></i> #{I18n.t("gui.menu.home")}".html_safe, :root_path
  def index
  end
end
