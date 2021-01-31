class CreatePlofiles < ActiveRecord::Migration[6.0]
  def change
    create_table :plofiles do |t|
      t.references :user, null: false
      t.string :nickname
      t.text :introduction
      t.integer :gender
      t.timestamps
    end
  end
end
