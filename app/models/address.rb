class Address < ApplicationRecord
  belongs_to :district, optional: true
  has_many :enterprises, foreign_key: :headquarters_id, inverse_of: :headquarters, dependent: :nullify
end
