require 'rails_helper'

describe 'GET /api/v1/users/:id/unread', type: :request do
  let(:user) { User.create!(name: 'SuperMan', signature: '', email: 'foo@bar.com', password: '123123')}
  let(:auth_params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  let(:auth_header) do
    auth_request = post user_session_path, params: auth_params
    response.headers['Authorization']
  end

  context 'when user authenticated' do
    it 'returns 200' do
      get api_v1_user_unread_path(user.id), headers: { 'Authorization' => auth_header, "CONTENT_TYPE" => "application/json" }
      expect(response).to have_http_status(200)
    end
  end

  context 'when user not authenticated' do
    it 'returns unathorized status' do
      get api_v1_user_unread_path(user.id)
      expect(response).to have_http_status(401)
    end
  end
end
