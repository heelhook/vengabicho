class TrainingArea < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [ :slugged, :finders ]

  belongs_to :user
  has_and_belongs_to_many :exercises

  validates :slug, presence: true

  delegate :slug, to: :user, prefix: true, allow_nil: true

  def self.global
    TrainingArea.where(user: nil).all
  end

  private

  def slug_candidates
    [
      [ :name ],
      [ :user_slug, :name, ],
    ]
  end
end
