class AddUnblockedAtToSyncs < ActiveRecord::Migration[7.2]
  def change
    add_column :syncs, :unblocked_at, :datetime
    add_column :syncs, :blocked, :virtual, type: :boolean, as: "case when unblocked_at is null then '1' else null end"
    add_index :syncs, %i[person_id blocked], unique: true
  end
end
