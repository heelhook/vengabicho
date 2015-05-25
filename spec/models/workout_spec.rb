require 'rails_helper'

RSpec.describe Workout, type: :model do
  describe 'add_exercises' do
    it 'adds all available exercises' do
      workout = create(:workout)

      expect{workout.add_exercises}.to change{workout.workout_exercises.to_a.count}.from(0).to(Exercise.count)
    end

    it 'adds only non currently existing exercises' do
      workout = create(:workout)
      workout.workout_exercises.create(exercise: Exercise.first)

      expect{workout.add_exercises}.to change{workout.workout_exercises.to_a.count}.from(1).to(Exercise.count)
    end
  end

  describe 'add_training_area_points' do
    it 'adds all training areas' do
      workout = create(:workout)

      expect{workout.add_training_area_points}.to change{workout.training_area_points.to_a.count}.from(0).to(TrainingArea.count)
    end

    it 'adds only non currently existing exercises' do
      workout = create(:workout)
      workout.training_area_points.create(training_area: TrainingArea.first, points: 1)

      expect{workout.add_training_area_points}.to change{workout.training_area_points.to_a.count}.from(1).to(TrainingArea.count)
    end
  end
end
