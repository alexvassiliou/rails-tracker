class Good < ApplicationRecord
  require 'csv'

  validates :name, presence: true
  validates :category, presence: true
  validates :source, presence: true
  validates :destination, presence: true
  validates :consignment, presence: true, uniqueness: true
  validates :entry_at, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      goods_hash = row.to_hash
      existing_records = where(consignment: goods_hash["consignment"], name: goods_hash["name"])

      if existing_records.present?
        existing_records.first.update_attributes(goods_hash)
      else
        create!(goods_hash)
      end
    end
  end

  def self.search(search)
    sql_search = "name ILIKE :search OR consignment ILIKE :search OR category ILIKE :search OR destination ILIKE :search OR source ILIKE :search"
    if search
      where(sql_search, search: "%#{search}%")
    else
      unscoped
    end
  end
end
