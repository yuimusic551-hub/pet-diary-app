class Pet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :species
  belongs_to :gender

  # 誰が飼い主か
  belongs_to :user
  # 日記との紐付け（あとでdiariesテーブルを作ります）
  has_many :diaries

  # 空欄で保存できないようにするバリデーション
  validates :name, :birth_date, presence: true

  # 選択肢が「--（id: 1）」の時は保存できないようにする
  validates :species_id, :gender_id, numericality: { other_than: 1 , message: "を選んでください" }
end