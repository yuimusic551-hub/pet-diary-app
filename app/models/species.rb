# frozen_string_literal: true

class Species < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '犬' },
    { id: 3, name: '猫' },
    { id: 4, name: 'ハムスター' },
    { id: 5, name: 'その他' }
  ]

  include ActiveHash::Associations

  has_many :pets, dependent: :destroy
end
