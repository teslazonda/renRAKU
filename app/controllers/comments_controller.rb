class CommentsController < ApplicationController
  def create
    authorize @comment
  end

  def new
    authorize @comment
  end
end
