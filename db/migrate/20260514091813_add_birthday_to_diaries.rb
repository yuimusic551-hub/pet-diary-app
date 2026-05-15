# frozen_string_literal: true

class AddBirthdayToDiaries < ActiveRecord::Migration[7.1]
  def change
    add_column :diaries, :birthday, :date
  end
end
