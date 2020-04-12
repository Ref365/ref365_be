require "rails_helper"

RSpec.describe Types::QueryType do
  describe "can query an event" do
    it "successfully" do
      user = User.create(name: "Example User", email: "example.user@example.com")
      event = user.events.create(
        title: "Soccer Game",
        notes: "The game was muddy.",
        date: "2018-07-21 00:00:00 UTC",
        time: "2020-04-04 14:00:00 UTC",
        mileage: 36.1,
        income: 125.00
      )

      json_response = Ref365BeSchema.execute(query_an_event(event)).as_json
      expect(json_response["data"]["event"]["title"]).to eq("Soccer Game")
      expect(json_response["data"]["event"]["notes"]).to eq("The game was muddy.")
      expect(json_response["data"]["event"]["date"]).to eq("2018-07-21 00:00:00 UTC")
      expect(json_response["data"]["event"]["time"]).to eq("2020-04-04 14:00:00 UTC")
      expect(json_response["data"]["event"]["mileage"]).to eq(36.1)
      expect(json_response["data"]["event"]["income"]).to eq(125.00)
    end
  end

  def query_an_event(event)
    <<~GQL
    {
      event(id: #{event.id}) {
        title
        notes
        date
        time
        mileage
        income
      }
    }
    GQL
  end
end