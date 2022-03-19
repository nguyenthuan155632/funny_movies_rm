# frozen_string_literal: true

require 'test_helper'

class MovieFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'cannot create a new movie because user had not signed in yet' do
    sign_out :user
    post '/movies', params: {
      movie: {
        title: 'New Title',
        description: 'New Description',
        url: 'https://www.youtube.com/watch?v=oXXI9wfTgBY',
        user_id: users(:one).id
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal '/users/sign_in', path
    assert_equal 'You need to sign in or sign up before continuing.', flash[:alert]
  end

  test 'cannot create a new movie because data is invalid - missing params' do
    post '/movies', params: {
      movie: {
        url: 'https://www.youtube.com/watch?v=oXXI9wfTgBY'
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal '/', path
    assert_equal 'Movie was created failure.', flash[:error]
  end

  test 'can create a new movie' do
    post user_session_path, params: { user: {
      email: users(:one).email,
      password: 'password'
    } }

    post '/movies', params: {
      movie: {
        title: 'New Title',
        description: 'New Description',
        url: 'https://www.youtube.com/watch?v=oXXI9wfTgBY',
        user_id: users(:one).id
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal '/', path
    assert_equal 'Movie was created successfully.', flash[:notice]
  end

  test 'cannot destroy a movie because user had not signed in yet' do
    sign_out :user
    delete "/movies/#{movies(:one).id}"
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal '/users/sign_in', path
    assert_equal 'You need to sign in or sign up before continuing.', flash[:alert]
  end

  test 'can destroy a movie' do
    delete "/movies/#{movies(:one).id}"
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal '/', path
    assert_equal 'Movie was destroyed successfully.', flash[:notice]
  end
end
