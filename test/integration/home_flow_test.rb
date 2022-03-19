require 'test_helper'

class HomeFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'can see elements without signing in' do
    sign_out :user
    get '/'
    assert_response :success
    assert_select 'a', 'Funny Movies'
    assert_select 'a', 'Share a movie'
    assert_select 'a', 'LOGIN'
  end

  test 'can see elements' do
    get '/'
    assert_response :success
    assert_select 'a', 'Funny Movies'
    assert_select 'a', 'Share a movie'
    assert_select 'a', 'nt.apple.it@gmail.com'
  end
end
