# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  "Balance",
  "Technique",
  "Mental",
  "Strength",
  "Elasticity",
  "Power",
  "Aerobic Recovery"
].each {|name| TrainingArea.find_or_create_by(name: name) }

{
  "Climbing" => %w(Technique),
  "Hangboard" => %w(Strength),
  "Campus" => %w(Power),
  "Limit Bouldering" => %w(Power Technique),
  "Running" => %w(Aerobic\ Recovery),
  "Yoga" => %w(Elasticity Balance),
  "ARC" => %w(Technique Aerobic\ Recovery),
  "Stretching" => %w(Elasticity Injury\ Prevention),
  "Supplemental Exercises" => %w(Strength Power Injury\ Prevention),
}.each do |name, training_areas|
  exercise = Exercise.find_or_initialize_by(name: name)
  exercise.training_areas = TrainingArea.where(name: training_areas).all
  exercise.save if exercise.new_record?
end
