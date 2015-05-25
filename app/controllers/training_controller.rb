class TrainingController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def index
    @motivational_items = MotivationService.fetch(current_user, count: 5).map(&:decorate)
  end

  def calendar
    @start_date = params[:start].to_date
    @end_date = params[:end].to_date
    @goals = current_user.goals.where(date: (@start_date..@end_date)).all

    @points = current_user.training_area_points.where(date: (@start_date..@end_date)).all.decorate

    @training_periods = current_user.training_periods
  end

  def motivate
    goal = current_user.goals.where('image_keywords IS NOT NULL').all.sample
    @keywords = goal.image_keywords.split(/, */).sample
    @images = Google::Search::Image.new(
      query: @keywords,
      image_type: :photo,
      image_size: :large,
    ).to_a.sample(15).map(&:uri)

    render layout: false
  end
end
