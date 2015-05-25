class CreateDpts < ActiveRecord::Migration
  def change
    create_table :dpts do |t|
      t.references    :region
      t.string            :value
      t.string            :category
    end

    add_index :dpts, :region_id
  end
end
