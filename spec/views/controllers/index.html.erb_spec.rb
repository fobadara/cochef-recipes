require 'rails_helper'

RSpec.describe 'controllers/index', type: :view do
  before(:each) do
    assign(:controllers, [
             Controller.create!(
               name: 'Name',
               name: 'Name'
             ),
             Controller.create!(
               name: 'Name',
               name: 'Name'
             )
           ])
  end

  it 'renders a list of controllers' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
  end
end
