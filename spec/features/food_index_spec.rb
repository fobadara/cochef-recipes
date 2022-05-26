require 'rails_helper'

RSpec.describe "Food's Index Page", type: :feature do
  before(:each) do
    visit user_session_path

    @user = User.create(name: 'Example User', email: 'abc@mail.com', password: 'helloworld')
    @foood = Food.create(name: 'Example Food', measurement_unit: 'g', price: 0, user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit foods_path
  end

  it 'displays the food name' do
    expect(page).to have_content(@foood.name)
  end

  it 'displays the food measurement unit' do
    expect(page).to have_content(@foood.measurement_unit)
  end

  it 'displays the food price' do
    expect(page).to have_content(@foood.price)
  end

  # it 'displays the food user' do
  #   expect(page).to have_content(@user.name)
  # end

  # it 'displays the food user email' do
  #   expect(page).to have_content(@user.email)
  # end
end
