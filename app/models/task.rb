# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :text, presence: true
  belongs_to :user
end
