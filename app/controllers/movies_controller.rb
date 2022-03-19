# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :set_movie, only: :destroy

  def create
    @movie = Movie.create!(movie_params)
    redirect_to root_path
  end

  def destroy
    @movie.destroy!
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :url, :description, :user_id)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
