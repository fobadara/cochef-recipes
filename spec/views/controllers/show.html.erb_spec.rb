require 'rails_helper'

RSpec.describe 'controllers/show', type: :view do
  before(:each) do
    @controller = assign(:controller, Controller.create!(
                                        name: 'Name',
                                        name: 'Name'
                                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Name/)
  end
end
