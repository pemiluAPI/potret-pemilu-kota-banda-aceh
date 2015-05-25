class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.references    :region_category
      t.string            :name
    end

    add_index :regions, :region_category_id
  end
end
