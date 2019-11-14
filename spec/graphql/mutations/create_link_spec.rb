require 'rails_helper'

describe Mutations::CreateLink, type: :request do
  describe '.resolve' do
    subject(:http_request) { post '/graphql', params: { query: query } }

    let(:query) do
      <<~GQL
        mutation {
          createLink(
            url: "example.com",
            description: "Example Website",
          ){
            id
            url
            description
          }
        }
      GQL
    end

    it 'creates a link' do
      expect { http_request }.to change(Link, :count).by 1
    end

    it 'returns the link information' do
      http_request
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:data][:createLink]).to include(:id, :url, :description)
    end
  end
end
