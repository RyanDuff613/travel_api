require 'rails_helper'
require 'pry'

describe 'post a review route', :type => :request do
  before do
    post '/reviews', params: {:user_name => 'guy', :rating => 4, :content => 'stuff', :country => 'spain', :city => 'madrid'}
  end

  it 'returns message if post is created' do
    expect(JSON.parse(response.body)).to eq({"message"=>"your review was saved succesfully"})
  end
  
  it 'returns the user_name' do
    response_to = Review.last
    expect(response_to.user_name).to eq('guy')
  end

  it 'returns the review content' do
    response_to = Review.last
    expect(response_to.content).to eq('stuff')
  end

  it 'returns the review rating' do
    response_to = Review.last
    expect(response_to.rating).to eq(4)
  end

  it 'returns the review country' do
    response_to = Review.last
    expect(response_to.country).to eq('spain')
  end

  it 'returns the review city' do
    response_to = Review.last
    expect(response_to.city).to eq('madrid')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end