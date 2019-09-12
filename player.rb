class Player
  attr_reader :name, :minimum_desired_proficiency, :proficiency

  def initialize(name, proficiency, minimum_desired_proficiency)
    @name, @proficiency, @minimum_desired_proficiency = name, proficiency, minimum_desired_proficiency
  end

end