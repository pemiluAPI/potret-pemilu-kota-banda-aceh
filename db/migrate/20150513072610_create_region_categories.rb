class CreateRegionCategories < ActiveRecord::Migration
  def change
    create_table :region_categories do |t|
      t.string    :name
      t.string    :description
    end
  end
end
