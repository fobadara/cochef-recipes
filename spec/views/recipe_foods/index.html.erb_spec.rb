require 'rails_helper'

RSpec.describe "recipe_foods/index", type: :view do
  before(:each) do
    assign(:recipe_foods, [
      RecipeFood.create!(
        quantity: 2,
        recipe: "",
        food: ""
      ),
      RecipeFood.create!(
        quantity: 2,
        recipe: "",
        food: ""
      )
    ])
  end

  it "renders a list of recipe_foods" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
