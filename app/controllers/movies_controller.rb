# frozen_string_literal: true

class MoviesController < ApplicationController
  def create
    @movie = Movie.create(movie_params)
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :url, :description, :user_id)
  end
end
