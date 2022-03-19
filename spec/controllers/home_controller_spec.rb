# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  subject do
    get :index
    response
  end

  describe 'GET /' do
    context 'when user not signed in' do
      it {
        expect(subject.status).to eq 200
      }
    end

    context 'when user signed in' do
      before do
        sign_in(user)
      end

      let!(:user) { create(:user) }

      it {
        expect(subject.status).to eq 200
      }
    end
  end
end
