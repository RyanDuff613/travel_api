require 'rails_helper'
require 'pry'

describe 'post a review route', :type => :request do
  let!(:review) {FactoryBot.create(:review)}
  before { post '/reviews', params: {:user_name => :user_name, :rating => :rating, :content => :content, :country => :country, :city => :city} }
  
  it 'returns the user_name' do
    get '/reviews/1'
    binding.pry
    expect(JSON.parse(response.body)[:user_name]).to eq('guy')
  end

  # it 'returns the review content' do
  #   expect(JSON.parse(response.body)['content']).to eq('test_content')
  # end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end