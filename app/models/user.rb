class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [ :slugged, :finders ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :workouts, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :training_area_points, dependent: :destroy
  has_many :training_periods, dependent: :destroy

  validates :name, :email, :slug, presence: true
  validates :email, :slug, uniqueness: true

  private

  def slug_candidates
    [
      [ :name ],
    ]
  end
end
