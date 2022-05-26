require 'rails_helper'

RSpec.describe 'Inventories', type: :model do
  context 'when user is not logged in' do
    it 'redirects user to login page' do
      get inventories_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'shows flash message' do
      get inventories_path
      expect(flash[:alert]).to eq('You need to sign in or sign up before continuing.')
    end
  end

  context 'when user is logged in' do
    include Warden::Test::Helpers

    before(:each) do
      @david = User.create(email: 'david@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
      login_as(@david)

      get inventories_path

      @inventory = Inventory.create(name: 'Example Inventory', user_id: @david.id)

      get new_inventory_path
end