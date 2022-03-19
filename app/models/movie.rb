# frozen_string_literal: true

class Movie < ApplicationRecord
  acts_as_votable

  belongs_to :user

  validates :title, :description, :url, presence: true
end
