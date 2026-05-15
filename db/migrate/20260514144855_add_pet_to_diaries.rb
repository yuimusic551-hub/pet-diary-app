# frozen_string_literal: true

class AddPetToDiaries < ActiveRecord::Migration[7.1]
  def change
    add_reference :diaries, :pet, null: false, foreign_key: true
  end
end
