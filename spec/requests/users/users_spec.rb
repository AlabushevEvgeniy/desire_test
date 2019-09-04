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

describe "GET /api/v1/users/:id/posts", type: :request do
  let(:user) { User.create!(name: 'SuperMan', signature: '', email: 'foo@bar.com', password: '123123')}
  let(:model_post) { Post.create!(title: 'foobar', preview: 'example', text: '123123', published: true, user_id: user.id) }
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
      get api_v1_user_posts_path(user.id), headers: { 'Authorization' => auth_header, "CONTENT_TYPE" => "application/json" }
      expect(response).to have_http_status(200)
    end
  end

  context 'when user not authenticated' do
    it 'returns 200' do
      get api_v1_user_posts_path(user.id)
      expect(response).to have_http_status(200)
    end
  end
end
