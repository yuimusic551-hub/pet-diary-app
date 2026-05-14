class AllowNullForPetAndAnimalInDiaries < ActiveRecord::Migration[7.0]
  def change
    # pet_id と animal_id の「空っぽ禁止（NotNull）」を解除します
    change_column_null :diaries, :pet_id, true
    change_column_null :diaries, :animal_id, true
  end
end