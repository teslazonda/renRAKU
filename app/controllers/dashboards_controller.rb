class DashboardsController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index
   add_breadcrumb "Dashboard", :dashboards_path
  def index
  end
end
