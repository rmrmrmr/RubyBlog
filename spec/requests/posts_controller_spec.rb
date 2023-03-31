require 'rails_helper'

RSpec.describe PostsController, type: :request do
  context 'GET /index' do
    it 'returns succesful response status' do
      get '/users/:user_id/posts/', params: { user_id: 1 }
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      get '/users/:user_id/posts/', params: { user_id: 1 }
      expect(response).to render_template(:index)
    end
    it 'ensures the response body has the correct placeholder text' do
      get '/users/:user_id/posts/', params: { user_id: 1 }
      expect(response.body).to include('Here is a list of posts for a given user.')
    end
  end

  context 'GET /show' do
    it 'returns successful response status' do
      get '/users/:user_id/posts/:id', params: { user_id: 1, id: 1 }
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      get '/users/:user_id/posts/:id', params: { user_id: 1, id: 1 }
      expect(response).to render_template(:show)
    end
    it 'ensures the response body has the correct placeholder text' do
      get '/users/:user_id/posts/:id', params: { user_id: 1, id: 1 }
      expect(response.body).to include('This is the page for the clicked post.')
    end
  end
end