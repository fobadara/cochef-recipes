class AddImageToFood < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :image, :string
  end
end
