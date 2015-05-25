class CreateDctRecapitulations < ActiveRecord::Migration
  def change
    create_table :dct_recapitulations do |t|
      t.references    :region
      t.references    :dct_category
      t.string            :value
    end

    add_index :dct_recapitulations, :region_id
    add_index :dct_recapitulations, :dct_category_id
  end
end
