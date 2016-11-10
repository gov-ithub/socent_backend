class Enterprise < ApplicationRecord
  belongs_to :primary_caen, class_name: 'Caen'
  belongs_to :social_intervention_domain
  belongs_to :enterprise_category
  belongs_to :entrepreneur
end
