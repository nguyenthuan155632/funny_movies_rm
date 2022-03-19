# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies::DislikesController, type: :controller do
  describe 'PUT /movies/:id/dislike' do
    subject do
      put :update, params: { id: movie.id }, format: :js
      response
    end

    let!(:movie) { create(:movie) }
    let!(:user) { create(:user) }

    context 'when user have not signed in yet' do
      it { is_expected.to have_http_status 401 }
    end

    context 'when user signed in and disliked successfully' do
      before { sign_in(user) }

      it { is_expected.to have_http_status 200 }

      it { expect { subject }.to change(movie.get_dislikes, :size).from(0).to(1) }
    end
  end
end
