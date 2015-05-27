class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises, dependent: :destroy
  has_many :training_area_points, dependent: :destroy

  default_scope { order(date: :asc) }

  validates :user_id, :date, presence: true

  def add_exercises
    user.all_exercises.each do |exercise|
      self.workout_exercises.find_or_initialize_by(exercise: exercise)
    end
  end

  def add_training_area_points
    user.all_training_areas.each do |training_area|
      self.training_area_points.find_or_initialize_by(training_area: training_area)
    end
  end

  def past?
    (self.date <= Date.today)
  end
end
