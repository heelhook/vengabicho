class WorkoutDecorator < Draper::Decorator
  delegate_all

  def log_exercise_prompt
    if date > Date.today
      'What exercise are you planning on doing?'
    else
      'What exercise did you do?'
    end
  end
end
