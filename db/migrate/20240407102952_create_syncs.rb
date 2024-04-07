class CreateSyncs < ActiveRecord::Migration[7.2]
  def change
    create_table :syncs do |t|
      t.references :person, null: false, foreign_key: true, index: false

      t.timestamps
    end
  end
end
