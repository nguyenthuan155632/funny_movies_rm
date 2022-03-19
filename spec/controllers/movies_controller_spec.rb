# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe 'POST /movies' do
    subject do
      post :create, params: {
        movie: {
          title: 'New Title',
          description: 'New Description',
          url: 'https://www.youtube.com/watch?v=oXXI9wfTgBY',
          user_id: user.id
        }
      }
    end

    let!(:user) { create(:user) }

    context 'when user have not signed in yet' do
      it 'has flash message' do
        subject
        expect(request.flash[:alert]).to eq('You need to sign in or sign up before continuing.')
      end

      it { is_expected.to have_http_status 302 }
    end

    context 'when user signed in and created successfully' do
      before { sign_in(user) }

      it 'has flash message' do
        subject
        expect(request.flash[:notice]).to eq('Movie was created successfully.')
      end

      it { is_expected.to have_http_status 302 }
    end

    context 'when user signed in and had invalid data' do
      subject do
        post :create, params: {
          movie: {
            url: 'https://www.youtube.com/watch?v=oXXI9wfTgBY'
          }
        }
      end

      before { sign_in(user) }

      it 'has flash message' do
        subject
        expect(request.flash[:error]).to eq('Movie was created failure.')
      end

      it { is_expected.to have_http_status 302 }
    end
  end

  describe 'DELETE /movies/:id' do
    subject do
      delete :destroy, params: {
        id: movie.id
      }
    end

    let!(:movie) { create(:movie) }
    let!(:user) { create(:user) }

    context 'when user have not signed in yet' do
      it 'has flash message' do
        subject
        expect(request.flash[:alert]).to eq('You need to sign in or sign up before continuing.')
      end

      it { is_expected.to have_http_status 302 }
    end

    context 'when user signed in and destroyed successfully' do
      before { sign_in(user) }

      it 'has flash message' do
        subject
        expect(request.flash[:notice]).to eq('Movie was destroyed successfully.')
      end

      it { is_expected.to have_http_status 302 }
    end
  end
end
