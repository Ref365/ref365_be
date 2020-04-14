class Mutations::DeleteEvent < Mutations::BaseMutation
  argument :event_id, ID, required: true

  field :event, Types::EventType, null: false
  field :status, String, null: false

  def resolve(event_id:)
    event = Event.find(event_id)
    status = "Deleted event(id: #{event.id}): #{event.title}"
    event.delete
    {
      status: status
    }
  end
end