class AddNextDateToBlackboxContents < ActiveRecord::Migration[6.0]
  def change
    add_column :bbox_contents, :next_date, :datetime
  end
end
