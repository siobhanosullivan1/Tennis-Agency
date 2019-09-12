class Team

  require_relative 'player.rb'

  attr_reader :male_player, :female_player

  def initialize(male_player, female_player)
    @male_player, @female_player = male_player, female_player
  end

  def team_satisfaction
    if @male_player.minimum_desired_proficiency <= @female_player.proficiency
      male_satisfaction = 0
    else
      male_satisfaction = @female_player.proficiency - @male_player.minimum_desired_proficiency
    end

    if @female_player.minimum_desired_proficiency <= @male_player.proficiency
      female_satisfaction = 0
    else
      female_satisfaction = @male_player.proficiency - @female_player.minimum_desired_proficiency
    end
    male_satisfaction + female_satisfaction/2.0
  end

end