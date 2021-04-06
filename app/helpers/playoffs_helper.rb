module PlayoffsHelper
  class Playoff

    def go_to_playoff
      teams_a = DivisionStat.where(division: "A")
      teams_b = DivisionStat.where(division: "B")

      array_team_a = in_array(teams_a)
      array_team_b = in_array(teams_b)

      list_for_po_in_division_a = get_teams_to_playoff(array_team_a)
      list_for_po_in_division_b = get_teams_to_playoff(array_team_b)

      create_db_for_playoff(list_for_po_in_division_a)
      create_db_for_playoff(list_for_po_in_division_b)

      pair_list_a = pairing(list_for_po_in_division_a)
      pair_list_b = pairing(list_for_po_in_division_b)

      get_winners(pair_list_a)
      get_winners(pair_list_b)
    end

    def in_array(list)
      list_teams = []
      list.each{|i| list_teams << i}
      list_teams
    end

    def get_teams_to_playoff(list)
      list_for_playoff =[]
      list = list.sort_by {|x| [x.points] }
      for i in 1..4
        list_for_playoff << list[-i]
      end

      list_for_playoff
    end

    def create_db_for_playoff(list)

      list.each do |team|
        PlayoffStat.create!(division: team.division, team: team.team, win: 0, loss: 1, to_semifinal: false)
      end
    end

    def pairing(list)
      pairs = []
      strong_and_weak_teams =[]

      strong_team = list[-1]
      weak_team = list[0]

      strong_and_weak_teams << strong_team
      strong_and_weak_teams << weak_team

      list = list - strong_and_weak_teams
      pairs << strong_and_weak_teams
      pairs << list
      pairs
    end

    def get_winners(pairs)
      winner_index = rand(0..1)

      pairs.each do |pair|
        winner = pair[winner_index]
        update_teams_statistics(winner)
      end
    end

    def update_teams_statistics(team)
      winner_team = PlayoffStat.find_by(division: team.division, team: team.team)
      save_result(winner_team)
    end

    def save_result(team)
      team.update!(win: 1, loss: 0, to_semifinal: true)
    end

  end
end


