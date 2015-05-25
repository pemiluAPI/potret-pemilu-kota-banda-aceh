class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string    :name
      t.string    :full_name
      t.string    :chairman
      t.string    :secretary
      t.string    :treasurer
      t.string    :address
    end
  end
end
