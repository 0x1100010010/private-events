json.extract! event, :id, :name, :description, :location, :start_time, :end_time, :date, :created_at, :updated_at
json.url event_url(event, format: :json)
