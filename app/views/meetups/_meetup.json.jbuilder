json.extract! meetup, :id, :title, :location, :group, :date, :time, :created_at, :updated_at
json.url meetup_url(meetup, format: :json)