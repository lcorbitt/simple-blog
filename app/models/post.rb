# frozen_string_literal: true

class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  belongs_to :author
  has_many :elements, dependent: :destroy

  has_one_attached :hero_image
  validate :hero_image_attached?

  validates :title, :description, presence: true
  validates_length_of :description, within: 50..120

  scope :published, -> do
    where(published: true)
  end

  scope :most_recently_published, -> do
    order(published_at: :desc)
  end

  attr_accessor :slug

  def should_generate_new_friendly_id?
    new_record? || slug_changed? || title_changed?
  end

  private

  def hero_image_attached?
    if hero_image.attached? && !hero_image.content_type.in?(['image/jpeg'])
      errors.add(:hero_image, 'must be a JPEG')
    elsif hero_image.attached? == false
      errors.add(:hero_image, 'required')
    end
  end
end
