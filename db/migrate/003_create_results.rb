class CreateResults < ActiveRecord::Migration[5.1]
  def up
    create_table :results do |t|
      t.string :target, null: false
      t.references :dork, foreign_key: true
      t.text :str_body
      t.string :status
      t.string :message
      
      t.timestamps
    end
  end
end