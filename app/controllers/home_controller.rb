# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @movie = Movie.new
    @movies = Movie.order(created_at: :desc)
  end
end
