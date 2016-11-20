class Address < ApplicationRecord
  belongs_to :district, optional: true
  has_many :enterprises, dependent: :nullify
end
