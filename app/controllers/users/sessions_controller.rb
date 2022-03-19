# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    layout 'login'

    def create
      super
      flash[:notice] = 'Signed-in successfully!' if user_signed_in?
    end
  end
end
