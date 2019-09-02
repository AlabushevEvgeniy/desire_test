require 'rails_helper'

describe 'GET /api/v1/users/:id/favorites', type: :request do
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
      get '/api/v1/users/3/favorites', headers: { 'Authorization' => auth_header, "CONTENT_TYPE" => "application/json" }
      expect(response).to have_http_status(200)
    end
  end

  context 'when user not authenticated' do
    it 'returns unathorized status' do
      get api_v1_posts_path
      expect(response).to have_http_status(401)
    end
  end
end

describe 'POST /api/v1/posts/:id/add_to_favorites', type: :request do
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
      post "/api/v1/post/#{model_post.id}/add_to_favorites", headers: { 'Authorization' => auth_header, "CONTENT_TYPE" => "application/json" }
      expect(response).to have_http_status(200)
    end
  end

  context 'when user not authenticated' do
    it 'returns unathorized status' do
      post api_v1_post_add_to_favorites(model_post)
      expect(response).to have_http_status(401)
    end
  end
end
