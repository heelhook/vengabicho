class ExerciseDecorator < Draper::Decorator
  delegate_all

  def template_name
    name.downcase.underscore
  end
end
