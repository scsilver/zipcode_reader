class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.integer :value
      t.text :image_path

      t.timestamps null: false
    end
  end
end
