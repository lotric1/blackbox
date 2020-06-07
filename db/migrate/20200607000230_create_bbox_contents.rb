class CreateBboxContents < ActiveRecord::Migration[6.0]
  def change
    create_table :bbox_contents do |t|
      t.string :text
      t.datetime :insertion_date
      t.datetime :completion_date
      t.datetime :due_date
      t.boolean :completed
      t.boolean :pinned
      t.integer :pass_counter
      t.references :bbox, null: false, foreign_key: true

      t.timestamps
    end
  end
end
