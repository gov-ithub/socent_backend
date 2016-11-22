class Enterprise < ApplicationRecord
  belongs_to :primary_industry_classification, class_name: 'IndustryClassification', optional: true
  belongs_to :primary_social_intervention_domain, class_name: 'SocialInterventionDomain', optional: true
  belongs_to :enterprise_category, optional: true
  belongs_to :entrepreneur, optional: true
  has_many :uploads, dependent: :delete_all
  belongs_to :headquarters, inverse_of: :enterprises, class_name: 'Address', optional: true

  validates :number, uniqueness: true, presence: true
  validates :application_date, presence: true
  validates :name, presence: true
end
