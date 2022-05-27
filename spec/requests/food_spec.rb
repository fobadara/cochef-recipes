require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET foods_path' do
    context 'when user is not logged in' do
      it 'redirects user to login page' do
        get foods_path
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'shows flash message' do
        get foods_path
        expect(flash[:alert]).to eq('You need to sign in or sign up before continuing.')
      end
    end

    context 'when user is logged in' do
      include Warden::Test::Helpers

      before(:each) do
        @david = User.create(email: 'david@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
        login_as(@david)

        get foods_path
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the correct template' do
        expect(response.body).to render_template(:index)
      end
    end
  end

  describe 'GET new_path' do
    context 'when user is not logged in' do
      it 'redirects user to login page' do
        get new_food_path
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'shows flash message' do
        get new_food_path
        expect(flash[:alert]).to eq('You need to sign in or sign up before continuing.')
      end
    end

    context 'when user is logged in' do
      include Warden::Test::Helpers

      before(:each) do
        @david = User.create(email: 'david@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
        login_as(@david)

        get new_food_path
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the correct template' do
        expect(response.body).to render_template(:new)
      end

      it 'assigns a new food to @food' do
        expect(assigns(:food)).to be_a_new(Food)
      end
    end
  end
end
