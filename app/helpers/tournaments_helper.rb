module TournamentsHelper
  class Tournament

    def final_eight
      all_teams = Division.all

      teams_a = Division.where(division_name: "A")
      teams_b = Division.where(division_name: "B")

      all_teams.each do |team|
        DivisionStat.create!(division: team.division_name, team: team.team_name, win: 0, draw: 0, loss: 0, points: 0)
      end

      teams_a_arr = in_array(teams_a)
      teams_b_arr = in_array(teams_b)

      games_in_division(teams_a_arr)
      games_in_division(teams_b_arr)
    end

    def in_array(teams)
      arr = []
      teams.each { |i| arr << i}
      arr
    end

    def games_in_division(arr)
      prime_team = arr[0]
      arr.delete_at(0)
      teams = arr

      teams.each do |team|
        goals(prime_team, team)
      end
      games_in_division(teams) if teams.size != 1
    end

    def goals(prime_team, team)
      prime_team_goals = rand(0..10)
      team_goals = rand(0..10)

      update_teams_statistics(prime_team, prime_team_goals, team, team_goals)
    end

    def update_teams_statistics(prime_team, prime_team_goals, team, team_goals)
      prime_team_stat = DivisionStat.find_by(division: prime_team.division_name, team: prime_team.team_name)
      team_stat = DivisionStat.find_by(division: team.division_name, team: team.team_name)

      if prime_team_goals > team_goals
        save_result(prime_team_stat, team_stat)
      elsif prime_team_goals == team_goals
        save_as_draw(prime_team_stat, team_stat)
      else
        save_result(team_stat, prime_team_stat)
      end
    end

    def save_result(win_team, loss_team)
      win_team.update!(win: win_team.win + 1, points: win_team.points + 3)
      loss_team.update!(loss: loss_team.loss + 1)
    end

    def save_as_draw(team1, team2)
      team1.update!(draw: team1.draw + 1, points: team1.points + 1)
      team2.update!(draw: team2.draw + 1, points: team2.points + 1)
    end

  end
end

