class AddUserRefToBboxContent < ActiveRecord::Migration[6.0]
  def change
    add_reference :bbox_contents, :user, null: false, foreign_key: true
  end
end
