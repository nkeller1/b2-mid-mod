class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.references :studio, foreign_key: true

      t.timestamps
    end
  end
end
