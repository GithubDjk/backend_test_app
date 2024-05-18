require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do
  let(:user) { User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password") }

  let(:valid_attributes) { { title: 'Test Title', body: 'Test Body' } }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:api_v1_user]
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Content' do
        expect {
          post :create, params: { content: valid_attributes }
        }.to change(Content, :count).by(1)
      end

      it 'renders a JSON response with the new content' do
        post :create, params: { content: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(api_v1_content_url(Content.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new content' do
        post :create, params: { content: { title: nil, body: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:content) { create(:content, user: user) }

    it 'destroys the requested content' do
      expect {
        delete :destroy, params: { id: content.to_param }
      }.to change(Content, :count).by(-1)
    end

    it 'returns a success response' do
      delete :destroy, params: { id: content.to_param }
      expect(response).to have_http_status(:no_content)
    end
  end
end
