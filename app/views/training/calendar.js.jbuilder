json.array!((@start_date..@end_date).to_a) do |date|
  workout = current_user.workouts.where(date: date).first
  next if !workout || workout.workout_exercises.empty?

  json.start date.strftime('%Y-%m-%d')
  json.end date.strftime('%Y-%m-%d')
  json.title workout.workout_exercises.map(&:name).join(', ')
  json.className 'exercise'
end

json.array!(@goals) do |goal|
  json.title goal.name
  json.start goal.date.strftime('%Y-%m-%d')
  json.end goal.date.strftime('%Y-%m-%d')
  json.className "goal"
end

json.array!(@points) do |point|
  json.title point.training_area_name
  json.start point.date.strftime('%Y-%m-%d')
  json.end point.date.strftime('%Y-%m-%d')
  json.className "point #{point.training_area_slug}"
end

json.array!(@training_periods) do |training_period|
  json.start training_period.start.strftime('%Y-%m-%d')
  json.end training_period.finish.strftime('%Y-%m-%d')
  json.rendering 'background'
  json.color training_period.color
end
