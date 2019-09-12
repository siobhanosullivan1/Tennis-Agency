class Agency

  require_relative 'team.rb'

  def initialize
    @male_players = []
    @female_players = []
    @teams = []
  end

  def add_male_player(player)
    @male_players.push(player)
  end

  def add_female_player(player)
    @female_players.push(player)
  end

  def sort_by_proficiency(players)
    players.sort{|p2, p1| p2.proficiency <=> p1.proficiency}
  end

  def create_teams
    sorted_males = sort_by_proficiency(@male_players)
    sorted_females = sort_by_proficiency(@female_players)
    sorted_males.each_index do |i|
      @teams[i] = Team.new(sorted_males[i], sorted_females[i])
    end
  end

  def each_player
    i=0
    while i < @male_players.length
      if @male_players[i].proficiency >= 9
        yield @male_players[i]
      end
      if @female_players[i].proficiency >= 9
        yield @female_players[i]
      end
      i += 1
    end
  end

  def agency_to_s
    str = ''
    str += "Male Players:\n"
    @male_players.each_with_index do |i|
      str += "#{i.name}, proficiency: #{i.proficiency}, seeks proficiency >= #{i.minimum_desired_proficiency}\n"
    end
    str += "\nFemale Players:\n"
    @female_players.each_with_index do |i|
      str += "#{i.name}, proficiency: #{i.proficiency}, seeks proficiency >= #{i.minimum_desired_proficiency}\n"
    end
    return str

  end

  def teams_to_s
    str = ''
    @teams.each_index do |i|
      str += "(#{@teams[i].female_player.name}, #{@teams[i].male_player.name}) Satisfaction: #{@teams[i].team_satisfaction}\n"
    end
    return str
  end

  def team_fitness
    fitness = 0
    @teams.each_index do |i|
      fitness = @teams[i].team_satisfaction + fitness
      end
    return fitness
  end

  end