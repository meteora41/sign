class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      
      t.string "handle"
      t.string "gender"
      t.string "age"
      t.string "contact"
      t.integer "user_id"

      t.timestamps
    end
  end
end