class CreateRecruitings < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitings do |t|
    
    t.string :title,      null: false
    t.text :comment,      null: false
    t.string :datetime, null: false
    t.string :place,      null: false
    t.integer :person_id

      t.timestamps
    end
  end
end
