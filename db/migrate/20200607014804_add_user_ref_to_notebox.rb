class AddUserRefToNotebox < ActiveRecord::Migration[6.0]
  def change
    add_reference :noteboxes, :user, null: false, foreign_key: true
  end
end
