require 'test/unit'
require_relative 'team.rb'

class TeamTest < Test::Unit::TestCase

  def setup
    @my_male_player = Player.new('Michael', 6, 6)
    @my_female_player = Player.new('Eimear', 5,6 )
    @my_team = Team.new(@my_male_player, @my_female_player)
  end

  def test_team_satisfaction
    assert_equal(-0.5, @my_team.team_satisfaction)
  end

end