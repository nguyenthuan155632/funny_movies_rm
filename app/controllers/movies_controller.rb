# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: :destroy

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = 'Movie was created successfully.'
    else
      flash[:error] = 'Movie was created failure.'
    end
    redirect_to root_path
  end

  def destroy
    if @movie.destroy
      flash[:notice] = 'Movie was destroyed successfully.'
    else
      flash[:error] = 'Movie was destroyed failure.'
    end
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
