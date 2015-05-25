class TrainingPeriod < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :name, :start, :finish, :color, presence: true
end
