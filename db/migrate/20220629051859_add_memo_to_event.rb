class AddMemoToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :memo, :text
  end
end
