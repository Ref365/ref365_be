require "rails_helper"

RSpec.describe Types::QueryType do
  describe "can query a user" do
    it "successfully" do
      user_name = "Example User"
      user_email = "example.user@example.com"
      user = User.create!(name: user_name, email: user_email)

      json_response = Ref365BeSchema.execute(query_a_user(user)).as_json

      expect(json_response["data"]["user"]["name"]).to eq(user_name)
      expect(json_response["data"]["user"]["email"]).to eq(user_email)
    end
  end

  describe "can query all user" do
    it "successfully" do
      create_list(:user, 3)

      json_response = Ref365BeSchema.execute(query_all_users).as_json
      expect(json_response["data"]["users"].length).to eq(3)
      expect(json_response["data"]["users"].first.keys).to eq(["name", "email"])
    end
  end

  def query_a_user(user)
    <<~GQL
    {
      user(id: #{user.id}) {
        name
        email
      }
    }
    GQL
  end

  def query_all_users
    <<~GQL
    {
      users {
        name
        email
      }
    }
    GQL
  end
end