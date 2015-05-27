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

  before_save :setup_resources

  serialize :colors, Hash

  private

  def setup_resources
    self.colors = {
      yellow: '#F4D068',
      light_blue: '#7EA2F4',
      blue: '#4362F4',
      pink: '#F44386',
    }
  end

  def slug_candidates
    [
      [ :name ],
    ]
  end
end
