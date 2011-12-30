class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :observation
      t.timestamps
    end
  end
end
