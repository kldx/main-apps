class Article < ApplicationRecord
  enum status: [:pending, :approved, :rejected]
  extend FriendlyId
  include HTTParty
  acts_as_taggable
  mount_uploader :default_image, DefaultImageUploader

  belongs_to :user

  after_initialize :set_default_status, if: :new_record?

  friendly_id :title, use: [:slugged, :finders, :history]

  validates :title, presence: {message: "can't be blank"}, length: { in: 2..250 }
  validates :description, presence: {message: "can't be blank"}
  validates :default_image, presence: {message: "can't be blank"}

  default_scope -> { order('articles.created_at DESC') }
  scope :still_pending, -> { where ('status = 0')}
  scope :been_approved, -> { where ('status = 1')}
  scope :been_rejected, -> { where ('status = 2')}
  scope :sponsored, -> { where ('sponsored is TRUE') }
  scope :published_only, -> { where('sponsored IS NOT TRUE') }
  scope :featured, -> { where ('featured = TRUE')}

  def sponsored?
    self.sponsored == TRUE
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def set_default_status
    self.status ||= :approved
  end

  def tag_list
    self.tags.join(',')
  end
end
