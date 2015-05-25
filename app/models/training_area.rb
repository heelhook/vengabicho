class TrainingArea < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [ :slugged, :finders ]

  belongs_to :user
  has_and_belongs_to_many :exercises

  validates :slug, presence: true

  def self.[](name)
    TrainingArea.where(name: name).first!
  end

  private

  def slug_candidates
    [
      [ :name ]
    ]
  end
end
