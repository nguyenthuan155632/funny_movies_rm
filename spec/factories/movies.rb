# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  url         :string           not null
#  title       :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :movie do
    association :user
    url { 'https://www.youtube.com/watch?v=eAZ9RwUNtuY' }
    title { 'Youtube Video' }
    description { 'My description' }
  end
end
