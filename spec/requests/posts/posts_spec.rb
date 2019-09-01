require 'rails_helper'

RSpec.describe 'POST /api/v1/users', type: :request do
  let(:user) { User.create!(email: 'foo@bar.com', password: '123123')}
  let(:post) { Post.create!(title: 'foobar', text: '123123', user_id: user.id) }
  let(:url) { '/api/v1/users' }
  let(:params) do
    {
      post: {
        title: post.title,
        text: post.text,
        user_id: post.user.id
      }
    }
  end


  context 'when user authenticated' do
    before do
      post '/api/v1/users',
      params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end
  end

  context 'when user not authenticated' do
    before { post url }

    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end
end
