json.array!(@teams) do |team|
  json.extract! team, :id, :team_name, :league, :players_id
  json.url team_url(team, format: :json)
end
