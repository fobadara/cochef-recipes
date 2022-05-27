class AddDefaultValueToPrice < ActiveRecord::Migration[6.1]
  def change
    change_column_default :foods, :price, 0
  end
end
