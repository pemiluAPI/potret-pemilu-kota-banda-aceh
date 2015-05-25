class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.references  :party
      t.references  :region_category
      t.string          :name
      t.string          :gender
      t.string          :address
      t.string          :note
      t.integer        :valid_votes
      t.boolean       :elected
      t.string          :ranked_valid_votes
      t.string          :order_number
    end

    add_index :candidates, :party_id
    add_index :candidates, :region_category_id
  end
end
