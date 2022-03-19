require "test_helper"

class LikeMovieFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'cannot like because user had not signed in yet' do
    sign_out :user
    put "/movies/#{movies(:one).id}/like", xhr: true
    assert_response 401
  end

  test 'can like a movie' do
    put "/movies/#{movies(:one).id}/like", xhr: true
    assert_response :success
  end
end
