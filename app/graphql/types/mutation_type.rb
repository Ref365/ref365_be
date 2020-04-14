module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_event, mutation: Mutations::CreateEvent
    field :delete_event, mutation: Mutations::DeleteEvent
  end
end
