class ParticipantsController < ApplicationController
  def create
    authorize @participant
  end

  def new
    authorize @participant
  end

  def index
    authorize @participant
  end
end
