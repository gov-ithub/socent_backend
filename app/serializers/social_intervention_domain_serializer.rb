class SocialInterventionDomainSerializer < ActiveModel::Serializer
  attributes :id, :description

  has_one :social_intervention_domain_category
end
