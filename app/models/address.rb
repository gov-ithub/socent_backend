class Address < ApplicationRecord
  belongs_to :district, optional: true
  has_many :enterprises, foreign_key: :headquarters_id, inverse_of: :headquarters, dependent: :nullify
  belongs_to :enterprise, inverse_of: :work_locations, optional: :true
end
