class CreatePartyVotes < ActiveRecord::Migration
  def change
    create_table :party_votes do |t|
      t.references    :party
      t.integer          :value
      t.string            :precentage
    end

    add_index :party_votes, :party_id
  end
end
