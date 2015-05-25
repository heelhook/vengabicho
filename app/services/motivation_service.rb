class MotivationService
  def self.fetch(user, count: 5)
    @goals = user.goals

    @items = [
      @goals
    ].flatten.sample(count)
  end
end
