class ChangeDateAtOnTurns < ActiveRecord::Migration
  def up
    remove_column :turns, :date_at
    add_column :turns, :day, :date
    add_column :turns, :hour, :time
  end

  def down
    add_column :turns, :date_at, :datetime
    remove_column :turns, :day
    remove_column :turns, :hour
  end
end
