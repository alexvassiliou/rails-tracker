class Good < ApplicationRecord
  require 'csv'
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :source, presence: true
  validates :destination, presence: true
  validates :consignment, presence: true
  validates :entry_at, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Good.create! row.to_hash
    end
  end

end
