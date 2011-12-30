class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phono
      t.string :email
      t.references :user, :polymorphic => true
      t.timestamps
    end
  end
end
