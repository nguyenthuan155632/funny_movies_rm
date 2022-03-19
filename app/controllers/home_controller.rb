# frozen_string_literal: true

class HomeController < ApplicationController
  DEFAULT_PAGINATION = 10

  def index
    @movie = Movie.new
    @movies = Movie.order(created_at: :desc).page(params[:page]).per(DEFAULT_PAGINATION)
  end
end
