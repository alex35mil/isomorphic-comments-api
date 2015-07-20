class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.text :comment, null: false

      t.timestamps null: false
    end
  end
end
