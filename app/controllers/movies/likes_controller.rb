# frozen_string_literal: true

module Movies
  class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_movie, only: :update

    def update
      @movie.liked_by(current_user)

      respond_to do |format|
        format.js { render :update }
      end
    end

    private

    def set_movie
      @movie = Movie.find(params[:id])
    end
  end
end
