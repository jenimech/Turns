class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.belongs_to :client
      t.belongs_to :professional
      t.datetime :date_at
      t.timestamps
    end
  end
end
