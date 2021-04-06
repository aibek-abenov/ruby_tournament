module FinalsHelper

  class Finals

    def go_to_final
      pairs_in_finals = SemifinalStat.where(to_final: true)

      pairs_in_finals.each do |team|
        FinalStat.create!(team: team.team, win: 0, loss: 1, is_winner: false)
      end

      get_winner(pairs_in_finals)
    end

    def get_winner(pair)
      winner_index = rand(0..1)
      winner = pair[winner_index]
      update_teams_statistics(winner)
    end

    def update_teams_statistics(team)
      winner_team = FinalStat.find_by(team: team.team)
      save_result(winner_team)
    end

    def save_result(team)
      team.update!(win: 1, loss: 0, is_winner: true)
    end

  end
end
