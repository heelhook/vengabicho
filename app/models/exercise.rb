class Exercise < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [ :slugged, :finders ]

  belongs_to :user
  has_and_belongs_to_many :training_areas

  validates :slug, presence: true

  delegate :slug, to: :user, prefix: true, allow_nil: true

  def self.global
    Exercise.where(user: nil).all
  end

  private

  def slug_candidates
    [
      [ :name ],
      [ :name, :user_slug ],
    ]
  end
end
