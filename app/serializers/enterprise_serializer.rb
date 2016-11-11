class EnterpriseSerializer < ActiveModel::Serializer
  attributes :id,
      :number,
      :name,
      :application_date,
      :tax_registration_code,
      :founded_at,
      :secondary_caens,
      :contact_name

  has_one :entrepreneur
  has_one :primary_caen
  has_one :enterprise_category
  has_one :social_intervention_domain
end
