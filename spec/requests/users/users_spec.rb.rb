require 'rails_helper'

describe "GET /api/v1/users", type: :request do
  describe 'request list of all users' do
    it 'return 200' do
      user = User.create(name: 'Test user')
      get api_v1_users_path
      expect(response).to be_successful
      expect(response.body).to include('Test user')
    end
  end
end
