require 'rails_helper'

RSpec.describe User, type: :model do
  it 'copies over global training areas' do
    user = create(:user)

    expect(user.training_areas).to_not be_empty
  end

  it 'copies over global exercises' do
    user = create(:user)

    expect(user.exercises.all).to_not be_empty
  end

  it 'assigns copied exercises to training areas' do
    user = create(:user)

    expect(user.exercises.map(&:training_areas).flatten).to_not be_empty
  end
end
