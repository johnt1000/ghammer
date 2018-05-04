class CreateDorks < ActiveRecord::Migration[5.1]
  def up
    create_table :dorks do |t|
      t.string :title, null: false
      t.text :search, null: false
      t.string :author
      t.text :description
      t.references :category, foreign_key: true
      
      t.timestamps
    end
  end
end