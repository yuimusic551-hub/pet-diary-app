class Diary < ApplicationRecord
  belongs_to :user
  # 以前の日記にペットが紐付いていなくても壊れないように、optional: true をつけます
  belongs_to :animal, optional: true
  has_one_attached :image
end