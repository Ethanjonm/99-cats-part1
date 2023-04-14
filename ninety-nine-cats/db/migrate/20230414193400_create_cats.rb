class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.date :birth_date null: false
      t.string :color
      t.string :name
      t.string :sex
      t.text :description

      t.timestamps
    end
  end
end
