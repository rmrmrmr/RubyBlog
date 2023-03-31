require 'rails_helper'

RSpec.describe UsersController, type: :request do
  context 'GET /index' do
    it 'returns successful response status' do
      get('/users')
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      get('/users')
      expect(response).to render_template(:index)
    end
    it 'ensures the response body has the correct placeholder text' do
      get('/users')
      expect(response.body).to include('Here is a list of users.')
    end
  end
end