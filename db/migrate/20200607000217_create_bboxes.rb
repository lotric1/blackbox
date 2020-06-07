class CreateBboxes < ActiveRecord::Migration[6.0]
  def change
    create_table :bboxes do |t|
      t.string :title
      t.datetime :creation_date
      t.integer :position
      t.integer :items_per_day
      t.boolean :starred
      t.string :color

      t.timestamps
    end
  end
end
