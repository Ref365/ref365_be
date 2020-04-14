require 'rails_helper'

module Mutations
  module Events
    RSpec.describe CreateEvent, type: :request do
      describe "Creates an event and returns new event details in JSON" do
        it "Successfully" do
          user = create(:user)
          title = "Soccer"
          notes = "Main ref"
          date = "2018-07-21 00:00:00 UTC"
          time = "2020-04-04 14:00:00 UTC"
          mileage = 30
          income = 123.33
          
          user_id = user.id
          expect do
            post '/graphql', params: { query: query(user_id, title, notes, date, time, mileage, income) }
          end.to change { Event.count }.by(1)

          json = JSON.parse(response.body)
          data = json["data"]["createEvent"]

          expect(data["event"]["id"]).to eq(Event.last.id.to_s)
          expect(data["event"]["title"]).to eq(title)
          expect(data["event"]["notes"]).to eq(notes)
          expect(data["event"]["date"]).to eq(date)
          expect(data["event"]["time"]).to eq(time)
          expect(data["event"]["mileage"]).to eq(mileage)
          expect(data["event"]["income"]).to eq(income)
        end

        it "Unsuccessfully" do
          post '/graphql', params: { query: bad_query }
          data = JSON.parse(response.body)
          expect(data["errors"].empty?).to eq(false)
        end
      end

      def bad_query
        <<~GQL
          mutation {
            createEvent(input: {
              userId: 1,
              title: "Example Title",
              time: "12-25-20",
              mileage: 5,
              income: "Not a number"
            }) {
              event {
                id
              }
            }
          }
        GQL
      end

      def query(user_id, title, notes, date, time, mileage, income)
        <<~GQL
          mutation {
            createEvent(input: {
              userId: #{user_id},
              title: "#{title}",
              notes: "#{notes}",
              date: "#{date}",
              time: "#{time}",
              mileage: #{mileage},
              income: #{income}
            }) {
            event {
              id
              title
              notes
              date
              time
              mileage
              income
            }
            }
          }
        GQL
      end
    end
  end
end