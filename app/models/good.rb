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
      existing_records = where(consignment: goods_hash["consignment"])

      if existing_records.present?
        existing_records.first.update_attributes(goods_hash)
      else
        create!(goods_hash)
      end
    end
  end
end
