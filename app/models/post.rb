# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author
  has_many :elements

  has_one_attached :hero_image
end
