module SemifinalsHelper
  class Semifinals

    def go_to_semifinal
      all_teams_in_semifinals = PlayoffStat.where(to_semifinal: true)

      pair_a = PlayoffStat.where(division: "A", to_semifinal: true)
      pair_b = PlayoffStat.where(division: "B", to_semifinal: true)

      all_teams_in_semifinals.each do |team|
        SemifinalStat.create!(division: team.division, team: team.team, win: 0, loss: 1, to_final: false)
      end

      get_winner(pair_a)
      get_winner(pair_b)
    end

    def get_winner(pair)
      winner_index = rand(0..1)
      winner = pair[winner_index]
      update_teams_statistics(winner)
    end

    def update_teams_statistics(team)
      winner_team = SemifinalStat.find_by(division: team.division, team: team.team)
      save_result(winner_team)
    end

    def save_result(team)
      team.update!(win: 1, loss: 0, to_final: true)
    end
  end
end
