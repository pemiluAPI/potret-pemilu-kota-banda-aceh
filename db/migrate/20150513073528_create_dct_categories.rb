class CreateDctCategories < ActiveRecord::Migration
  def change
    create_table :dct_categories do |t|
      t.string    :name
      t.string    :description
      t.string    :parent_id
    end
  end
end
