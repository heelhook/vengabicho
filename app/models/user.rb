class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [ :slugged, :finders ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true

  private

  def slug_candidates
    [
      [ :name ],
    ]
  end
end
