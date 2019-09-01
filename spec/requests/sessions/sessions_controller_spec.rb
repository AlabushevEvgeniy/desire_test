require 'rails_helper'

describe 'POST /api/v1/users/sign_in', type: :request do
  let(:user) { User.create!(email: 'foo@bar.com', password: '123123') }
  let(:url) { user_session_path }
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when params are correct' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JTW token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end
  end

  context 'when login params are incorrect' do
    before { post url }

    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end
end
