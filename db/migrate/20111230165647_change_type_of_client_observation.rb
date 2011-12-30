class ChangeTypeOfClientObservation < ActiveRecord::Migration
  def up
    change_column :clients, :observation, :text
  end

  def down
    change_column :clients, :observation, :string
  end
end
