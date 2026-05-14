class Animal < ApplicationRecord
  belongs_to :user
  has_many :diaries, dependent: :destroy
end