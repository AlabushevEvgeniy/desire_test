require 'rails_helper'

RSpec.describe 'POST /api/v1/posts', type: :request do
  let(:user) { User.create!(name: 'SuperMan', signature: '', email: 'foo@bar.com', password: '123123')}
  let(:model_post) { Post.new(title: 'foobar', preview: 'example', text: '123123', published: true, user_id: user.id) }
  let(:post_params) do
    {
      post: {
        title: model_post.title,
        text: model_post.text,
        user_id: user.id
      }
    }
  end

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
      post api_v1_posts_path, params: post_params.to_json, headers: { 'Authorization' => auth_header, "CONTENT_TYPE" => "application/json" }
      expect(response).to have_http_status(200)
    end
  end

  context 'when user not authenticated' do
    it 'returns unathorized status' do
      post api_v1_posts_path, params: post_params.to_json
      expect(response.status).to eq 401
    end
  end
end

RSpec.describe 'UPDATE /api/v1/posts/:id', type: :request do
  let(:user) { User.create!(name: 'SuperMan', signature: 'something', email: 'foo@bar.com', password: '123123')}
  let(:model_post) { Post.create!(title: 'foobar', preview: 'example', text: '123123', published: true, user_id: user.id) }
  let(:post_params) do
    {
      post: {
        title: model_post.title,
        text: model_post.text,
        user_id: user.id
      }
    }
  end

  let(:post_params_changed) do
    {
      post: {
        id: model_post.id,
        title: 'new_title',
        text: 'new_text',
        user_id: user.id
      }
    }
  end

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
      put "/api/v1/posts/#{model_post.id}", params: post_params_changed.to_json, headers: { 'Authorization' => auth_header, "CONTENT_TYPE" => "application/json" }
      expect(response).to have_http_status(200)
    end
  end

  context 'when user not authenticated' do
    it 'returns unathorized status' do
      post api_v1_posts_path, params: post_params_changed.to_json
      expect(response.status).to eq 401
    end
  end
end

RSpec.describe 'DELETE /api/v1/posts/:id', type: :request do
  let(:user) { User.create!(name: 'SuperMan', signature: 'something', email: 'foo@bar.com', password: '123123')}
  let(:model_post) { Post.create!(title: 'foobar', preview: 'example', text: '123123', published: true, user_id: user.id) }
  let(:post_params) do
    {
      post: {
        title: model_post.title,
        text: model_post.text,
        user_id: user.id
      }
    }
  end

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
      put "/api/v1/posts/#{model_post.id}", params: post_params.to_json, headers: { 'Authorization' => auth_header, "CONTENT_TYPE" => "application/json" }
      expect(response).to have_http_status(200)
    end
  end

  context 'when user not authenticated' do
    it 'returns unathorized status' do
      post api_v1_posts_path, params: post_params.to_json
      expect(response.status).to eq 401
    end
  end
end
