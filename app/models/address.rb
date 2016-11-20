class Address < ApplicationRecord
  belongs_to :district, optional: true
end
