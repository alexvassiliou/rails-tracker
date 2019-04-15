class Good < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :source, presence: true
  validates :destination, presence: true
  validates :consignment, presence: true
  validates :entry_at, presence: true


end
