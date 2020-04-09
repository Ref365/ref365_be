
module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :notes, String, null: true
    field :date, String, null: true
    field :time, String, null: true
    field :date_time, String, null: true
    field :mileage, Float, null: true
    field :income, Float, null: true
    field :user, Types::UserType, null: false
    
    def date_time
      time_string = object.time.strftime("%H:%M:%S%p")
      date_string = object.date.strftime("%e %b %Y")
      date = "#{date_string} #{time_string}"
      DateTime.parse(date)
    end
  end
end
