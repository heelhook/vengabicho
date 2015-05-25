class Exercise < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [ :slugged, :finders ]

  has_and_belongs_to_many :training_areas

  validates :slug, presence: true

  def self.[](name)
    Exercise.where(name: name).first!
  end

  private

  def slug_candidates
    [
      [ :name ]
    ]
  end
end
