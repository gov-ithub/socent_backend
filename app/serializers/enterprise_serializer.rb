class EnterpriseSerializer < ActiveModel::Serializer
  attributes :id,
      :number,
      :name,
      :application_date,
      :certificate_type,
      :unique_registration_code,
      :tax_registration_by,
      :tax_registration_number,
      :founded_at,
      :secondary_industry_classifications,
      :secondary_social_intervention_domains,
      :contact_name

  has_one :entrepreneur
  has_one :primary_industry_classification
  has_one :enterprise_category
  has_one :primary_social_intervention_domain
  has_many :uploads
end
