module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_event, mutation: Mutations::CreateEvent
  end
end
