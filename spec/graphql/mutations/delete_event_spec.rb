require "rails_helper"

module Mutations
  module Events
    RSpec.describe DeleteEvent, type: :request do
      describe "Delete an event and return confirmation" do
        it "Successfully" do
          user = create(:user)
          event = create(:event)

          expect do
            post '/graphql', params: { query: query(event.id) }
          end.to change { Event.count }.by(-1)

          json = JSON.parse(response.body)
          expect(json["data"]["deleteEvent"]["status"]).to eq("Deleted event(id: #{event.id}): #{event.title}")
        end
      end

      def query(event_id)
        <<~GQL
          mutation {
            deleteEvent(input: {
              eventId: #{event_id}
            }) {
            status
            }
          }
        GQL
      end
    end
  end
end