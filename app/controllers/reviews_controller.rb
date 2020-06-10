class ReviewsController < ApplicationController
 

def index
    if params[:country]
      @reviews = Review.country_reviews(params[:country])
      # binding.pry
      json_response(@reviews)
    elsif params[:city]
      @reviews = Review.city(params[:city])
      json_response(@reviews)
    elsif params[:rating]
      @reviews = Review.rating(params[:rating])
      json_response(@reviews)
    elsif params[:user_name]
      @reviews = Review.user_name(params[:user_name])
      json_response(@reviews)
    else
      @reviews = Review.all
      json_response(@reviews)
      # @reviews_to_display = @reviews.page(params[:page]).per(5)
      # render :index
    end
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    if Review.create!(review_params)
      render status: 201, json: {
        message: "your review was saved succesfully"
      }
    end
  end

  def update
    review_params
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
        message: "updated succesfully"
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      render status: 200, json: {
        message: "deleted succesfully"
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def review_params
    params.permit(:user_name, :content, :rating, :country, :city, :id)
  end

  # swagger_controller :reviews, "Reviews Controller"

  # swagger_api :index do
  #   summary "Gets all reviews in database"
  #   notes "Lists all current reviews"
  #   param :integer, :optional, "Review ID"
  #   response :unprocessable_entity, "Couldn't add review"
  #   response :not_found, "Not Found"
  # end


end