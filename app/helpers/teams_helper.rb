module TeamsHelper
  class Divisions

    def into_division
      teams = Team.all
      teams_name = []

      teams.each do |team|
        teams_name << team.name
      end

      get_list(teams_name)
    end

    def get_list(teams_list)
      division_size = teams_list.length / 2

      division_a = teams_list.sample(division_size)

      division_b = teams_list - division_a
      Division.destroy_all
      save_in_db(division_a, division_b)
    end

    def save_in_db(a,b)
      a.each do |team|
        Division.create(division_name: "A", team_name: team)
      end

      b.each do |team|
        Division.create(division_name: "B", team_name: team)
      end
    end

  end
end
