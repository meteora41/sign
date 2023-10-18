class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|
      
      t.string :conversation
      t.integer :recruiting_id
      t.integer :person_id

      t.timestamps
    end
  end
end
