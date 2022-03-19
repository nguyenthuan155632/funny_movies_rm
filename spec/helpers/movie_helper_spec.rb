# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieHelper, type: :helper do
  describe '#movie_iframe' do
    subject { helper.movie_iframe(movie) }

    let!(:movie) do
      create(:movie, url: url)
    end

    context 'when youtube format is full' do
      let(:url) { 'https://www.youtube.com/watch?v=eAZ9RwUNtuY' }

      it {
        is_expected.to include '<iframe src="//www.youtube.com/embed/eAZ9RwUNtuY" width="560" height="315"'
      }
    end

    context 'when youtube format is short' do
      let(:url) { 'youtu.be/eAZ9RwUNtuY' }

      it {
        is_expected.to include '<iframe src="//www.youtube.com/embed/eAZ9RwUNtuY" width="560" height="315"'
      }
    end
  end
end
