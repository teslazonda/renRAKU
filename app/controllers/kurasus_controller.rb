class KurasusController < ApplicationController
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

  def index
    @user = current_user
    @kurasus = policy_scope(Kurasu)
  end
end
