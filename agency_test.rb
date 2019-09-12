require 'test/unit'
require_relative 'agency.rb'

class AgencyTest < Test::Unit::TestCase

  def setup
    @agency = Agency.new
    @my_male_player = Player.new('Michael', 6, 6)
    @my_female_player = Player.new('Eimear', 5, 6)

    @agency.add_male_player(@my_male_player)
    @agency.add_female_player(@my_female_player)
  end


  def test_agency_to_s
    assert_equal("Male Players:\nMichael, proficiency: 6, seeks proficiency >= 6\n\nFemale Players:\nEimear, proficiency: 5, seeks proficiency >= 6\n", @agency.agency_to_s)
  end


end