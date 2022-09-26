class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail_category
  belongs_to :detail_condition
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :delivery_day
end