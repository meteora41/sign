class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :person_id
      t.integer :recruiting_id

      t.timestamps
    end
  end
end
