require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:posts_path) { '/users/2/posts' }
  let!(:user_post_path) { '/users/2/posts/1' }

  describe 'GET /users/:user_id/posts' do
    it 'works! (now write some real specs)' do
      get posts_path
      expect(response).to have_http_status(200)
    end

    it 'Checks if a correct template was rendered' do
      get posts_path
      expect(response).to render_template('posts/index')
    end

    it 'checks if the response body includes correct placeholder text' do
      get posts_path
      expect(response.body).to include('<h1>Here is a list of user posts<h1>')
    end
  end

  describe 'GET /users/:user_id/posts/:post_id' do
    it 'works! (now write some real specs)' do
      get user_post_path
      expect(response).to have_http_status(200)
    end

    it 'Checks if a correct template was rendered' do
      get user_post_path
      expect(response).to render_template('posts/show')
    end

    it 'checks if the response body includes correct placeholder text' do
      get user_post_path
      expect(response.body).to include('<h1>Here is a user full post<h1>')
    end
  end
end
