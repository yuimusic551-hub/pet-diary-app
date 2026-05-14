class AddAnimalToDiaries < ActiveRecord::Migration[7.1]
  def change
    add_reference :diaries, :animal, null: false, foreign_key: true
  end
end
