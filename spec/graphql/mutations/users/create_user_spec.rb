
require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      describe '.resolve' do
        it 'creates a book' do
          name = "Harrison"
          email = "harrison@gmail.com"

          expect do
            post '/graphql', params: { query: query(name: name, email: email) }
          end.to change { User.count }.by(1)
        end

        it 'returns a user' do
          name = "Harrison"
          email = "harrison@gmail.com"

          require "pry"; binding.pry
          post '/graphql', params: { query: query(name: name, email: email) }
          json = JSON.parse(response.body)
          data = json['data']['createBook']

          expect(data).to include(
            'id'              => be_present,
            'title'           => "Harrison",
            'publicationDate' => "harrison@gmail.com",
          )
        end
      end

      def query(name:, email:)
        <<~GQL
          mutation {
            createUser(input: {
              name: #{name},
              email: #{email}"
            }) {
              user {
                id
                name
                email
              }
              errors
            }
          }
        GQL
      end
    end
  end
end