class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string     :name,       null: false
      t.date       :birth_date, null: false
      t.integer    :species_id, null: false
      t.integer    :gender_id,  null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end