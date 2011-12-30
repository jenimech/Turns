class AddMoreDataIntoProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :dni, :string
    add_column :profiles, :mobile_phono, :string
  end

  def down
    remove_column :profiles, :dni
    remove_column :profiles, :mobile_phono
  end
end
