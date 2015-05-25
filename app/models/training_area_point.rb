class TrainingAreaPoint < ActiveRecord::Base
  belongs_to :training_area
  belongs_to :workout
  belongs_to :user

  delegate :name, :slug, to: :training_area, prefix: true
  delegate :date, :user_id, to: :workout, prefix: true

  before_validation :set_data

  validates :user_id, :training_area_id, :workout_id, :date, presence: true
  validates :points, numericality: { greater_than: 0 }

  def set_data
    self.date = workout_date
    self.user_id = workout_user_id
  end
end
