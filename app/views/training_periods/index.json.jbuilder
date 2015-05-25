json.array!(@training_periods) do |training_period|
  json.extract! training_period, :id, :name, :start, :finish, :color
  json.url training_period_url(training_period, format: :json)
end
