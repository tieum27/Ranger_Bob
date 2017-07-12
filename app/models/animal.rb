class Animal < ApplicationRecord
  has_many :sigthings, dependent: :destroy
  validates :common_name, :latin_name, :kingdom, length: { in: 2..100}
end
