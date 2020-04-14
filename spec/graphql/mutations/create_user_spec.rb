
require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      describe "Creates a user and returns new user's details in JSON" do
        it "Successfully" do
          user_name = "Example User"
          email = "example.user@email.com"

          expect do
            post '/graphql', params: { query: query(user_name, email) }
          end.to change { User.count }.by(1)

          json = JSON.parse(response.body)
          data = json["data"]["createUser"]

          expect(data["user"]["id"]).to eq(User.last.id.to_s)
          expect(data["user"]["name"]).to eq(user_name)
          expect(data["user"]["email"]).to eq(email)
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
            createUser(input: {
              name: 21,
            }) {
              user {
                id
                name
                email
              }
            }
          }
        GQL
      end

      def query(user_name, email)
        <<~GQL
          mutation {
            createUser(input: {
              name: "#{user_name}",
              email: "#{email}"
            }) {
              user {
                id
                name
                email
              }
            }
          }
        GQL
      end
    end
  end
end