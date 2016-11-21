class EnterpriseSerializer < ActiveModel::Serializer
  attributes :id,
      :number,
      :name,
      :application_date,
      :tax_registration_code,
      :founded_at,
      :secondary_industry_classifications,
      :secondary_social_intervention_domains,
      :contact_name

  has_one :entrepreneur
  has_one :primary_industry_classification
  has_one :enterprise_category
  has_one :primary_social_intervention_domain
end
