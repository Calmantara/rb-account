# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Account API', type: :request do # rubocop:disable Metrics/BlockLength
  describe 'GET /accounts' do
    context ':index' do
      before do
        @account = FactoryBot.create(:account, username: 'user', email: 'user@gmail.com')
        puts @account
      end

      it 'return all accounts' do
        get '/api/v1/accounts'
        expect(response).to have_http_status(:ok) # test code
        expect(JSON.parse(response.body).size).to eq(1)
      end
    end
  end
  describe 'POST /accounts' do
    context ':create' do
      it 'create account' do
        expect do
          post '/api/v1/accounts', params: { account: { username: 'user', email: 'user@gmail.com' } }
        end.to change { Account.count }.from(0).to(1)
        expect(response).to have_http_status(:created)
      end
    end
  end
  describe 'DELETE /accounts' do
    context ':destroy' do
      let!(:account) { FactoryBot.create(:account, username: 'user', email: 'user@gmail.com') }
      it 'delete account' do
        expect do
          delete "/api/v1/accounts/#{account.id}"
        end.to change { Account.count }.from(1).to(0)
        expect(response).to have_http_status(:accepted)
      end
    end
  end
end
