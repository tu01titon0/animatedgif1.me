class Gif < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :user

  scope :sorted, ->{ order(created_at: :desc) }
  validates :image_data, presence: true


  acts_as_taggable
  def self.random
    order("RANDOM()").first
  end
  validate :has_at_least_one_tag

  def has_at_least_one_tag
    unless tag_list.present?
      errors.add(:tag_list, "must have at least one tag")
    end
  end


end
