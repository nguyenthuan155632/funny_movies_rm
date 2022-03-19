require 'test_helper'

class DislikeMovieFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'cannot dislike because user had not signed in yet' do
    sign_out :user
    put "/movies/#{movies(:one).id}/dislike", xhr: true
    assert_response 401
  end

  test 'can dislike a movie' do
    put "/movies/#{movies(:one).id}/dislike", xhr: true
    assert_response :success
  end
end
