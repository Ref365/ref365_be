class Mutations::CreateEvent < Mutations::BaseMutation
  argument :title, String, required: true
  argument :notes, String, required: true
  argument :date, String, required: true
  argument :time, String, required: true
  argument :income, Float, required: true
  argument :mileage, Float, required: true
  argument :user_id, ID, required: true

  field :event, Types::EventType, null: false
  field :errors, [String], null: false

  def resolve(title:, notes:, date:, time:, income:, mileage:, user_id:)
    user = User.find(user_id)
    event = user.events.new(title: title, notes: notes, date: date, time: time,
                    income: income, mileage: mileage, user_id: user_id)
    if event.save
      # Successful creation, return the created object with no errors
      {
        event: event,
        errors: [],
      }
    end
  end
end