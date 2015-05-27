class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [ :slugged, :finders ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :workouts, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :training_areas, dependent: :destroy
  has_many :training_area_points, dependent: :destroy
  has_many :training_periods, dependent: :destroy

  validates :name, :email, :slug, presence: true
  validates :email, :slug, uniqueness: true

  before_save :setup_resources
  after_create :copy_global_resources

  serialize :colors, Hash

  private

  def copy_global_resources
    TrainingArea.global.each do |training_area|
      self.training_areas.create!(
        name: training_area.name,
        description: training_area.description,
      )
    end

    Exercise.global.each do |exercise|
      new_exercise = self.exercises.create!(
        name: exercise.name,
        description: exercise.description,
      )

      exercise.training_areas.each do |training_area|
        new_exercise.training_areas << self.training_areas.where(name: training_area.name)
      end
    end
  end

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
