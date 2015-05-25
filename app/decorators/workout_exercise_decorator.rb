class WorkoutExerciseDecorator < Draper::Decorator
  delegate_all

  def training_area_slugs
    training_areas.map {|t| t.slug}
  end
end
