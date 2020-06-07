class AddUserRefToBbox < ActiveRecord::Migration[6.0]
  def change
    add_reference :bboxes, :user, null: false, foreign_key: true
  end
end
