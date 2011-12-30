class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.text :observation
      t.timestamps
    end
  end
end
