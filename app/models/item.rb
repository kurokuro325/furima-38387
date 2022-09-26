class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail_category
  belongs_to :detail_condition
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :image, presence: true
  validates :item, presence: true
  validates :explanation, presence: true
  validates :detail_category_id, presence: true
  validates :detail_condition_id, presence: true
  validates :delivery_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' },format: { with: /\A[0-9]+\z/ }

  validates :detail_category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :detail_condition_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_burden_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank" }
end