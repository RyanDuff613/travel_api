class ReviewsController < ApplicationController

  def index
    @reviews = {"review": "this place sucks"}
    json_response(@reviews)
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

end