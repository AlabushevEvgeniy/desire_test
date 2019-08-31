require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'request list of all users' do
    it 'return 200' do
      user = User.create(name: 'Test user')
      get '/api/v1/users'
      expect(response).to be_successful
      expect(response.body).to include('Test user')
    end
  end


end
