class Product < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :name, :price_cents, :description, presence: true
  validates :price_cents, numericality: { only_integer: true }

  has_one_attached :image

  def image_url
    rails_blob_path(image, only_path: true)
  end

  def props
    as_json(methods: %i[image_url])
  end

  def self.prep_for_react(collection)
    collection.map(&:props)
  end
end
