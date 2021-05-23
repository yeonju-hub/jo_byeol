json.extract! meeting, :id, :team_id, :schedule, :start_time, :place, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
