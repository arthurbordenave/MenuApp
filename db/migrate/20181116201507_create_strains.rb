class CreateStrains < ActiveRecord::Migration[5.2]
  def change
    create_table :strains do |t|
      t.string :name
      t.decimal :price
      t.decimal :thc
      t.decimal :cbd
      t.string :genotype
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
