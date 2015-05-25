class TrainingAreaPointDecorator < Draper::Decorator
  delegate_all

  def training_area_initials
    training_area_name.split(/ /).map{|s| s[0]}.join
  end
end
