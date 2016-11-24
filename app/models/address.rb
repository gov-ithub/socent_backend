class Address < ApplicationRecord
  belongs_to :district, optional: true

  belongs_to :headquarters_for_enterprise, class_name: 'Enterprise',
             inverse_of: :headquarters, optional: :true
  belongs_to :work_location_for_enterprise, class_name: 'Enterprise',
             inverse_of: :work_locations, optional: :true
end
