require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:users_path) { '/users/' }
  let!(:temp_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  describe 'GET /users' do
    it 'checks if response status is 200' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'Checks if a correct template was rendered' do
      get users_path
      expect(response).to render_template('users/index')
    end

    it 'checks if the response body includes correct placeholder text' do
      get users_path
      expect(response.body).to include('<h1>Here is a list of users<h1>')
    end
  end

  describe 'GET /users/:id' do
    it 'checks if response status is 200' do
      get "#{users_path}#{temp_user.id}"
      expect(response).to have_http_status(200)
    end

    it 'Checks if a correct template was rendered' do
      get "#{users_path}#{temp_user.id}"
      expect(response).to render_template('users/show')
    end

    it 'checks if the response body includes correct placeholder text' do
      get "#{users_path}#{temp_user.id}"
      expect(response.body).to include('<h1>Here is a user profile<h1>')
    end
  end
end
