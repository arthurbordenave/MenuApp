class ChangeTypeOfTitle < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :title, :string
  end
end
