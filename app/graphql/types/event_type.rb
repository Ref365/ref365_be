module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :body, String, null: true
    field :date, String, null: true
    field :time, String, null: true
    field :mileage, Float, null: true
    field :income, Float, null: true
  end
end
