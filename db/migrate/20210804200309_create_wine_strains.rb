class CreateWineStrains < ActiveRecord::Migration[6.0]
  def change
    create_table :wine_strains do |t|
      t.references :wine, null: false, foreign_key: true
      t.references :strain, null: false, foreign_key: true
      t.integer :percent

      t.timestamps
    end
  end
end
