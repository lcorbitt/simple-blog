# frozen_string_literal: true

class Element < ApplicationRecord
  belongs_to :post

  validates :element_type, inclusion: { in: %w[paragraph image] }

  has_rich_text :content
  has_one_attached :image

  def paragraph?
    self.element_type == "paragraph"
  end

  def image?
    self.element_type == "image"
  end
end
