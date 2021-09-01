class KurasusController < ApplicationController
  add_breadcrumb "Dashboard", :dashboards_path
  add_breadcrumb "Classes", :kurasus_path
  def index
    @user = current_user
    @kurasus = policy_scope(Kurasu)
  end

  def create
    authorize @kurasu
  end

  def new
    authorize @kurasu
  end

  def edit
    authorize @kurasu
  end

  def update
    authorize @kurasu
  end
end
