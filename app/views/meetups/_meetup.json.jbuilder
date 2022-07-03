json.extract! meetup, :id, :title, :location, :created_at, :updated_at
json.url meetup_url(meetup, format: :json)