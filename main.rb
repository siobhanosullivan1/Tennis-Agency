require_relative 'player.rb'
require_relative 'agency.rb'

agency = Agency.new

begin
IO.foreach('men.txt') do |line|
  data =  line.split
  name = data[0]
  proficiency = data[1].to_i
  minimum_desired_proficiency = data[2].to_i
  agency.add_male_player(Player.new(name, proficiency, minimum_desired_proficiency))
end
end rescue abort('error reading men.txt')

begin
IO.foreach('women.txt') do |line|
  data = line.split
  name = data[0]
  proficiency = data[1].to_i
  minimum_desired_proficiency = data[2].to_i
  agency.add_female_player(Player.new(name, proficiency, minimum_desired_proficiency))
end
end rescue abort('error reading women.txt')


puts agency.agency_to_s

puts"\nTeams:\n"
agency.create_teams
puts agency.teams_to_s

puts "\nElite:\n"
agency.each_player { |i| puts "#{i.name}"}

puts"\nTeam fitness:\n"
puts agency.team_fitness
#agency.steepest_ascent_hill_climb
