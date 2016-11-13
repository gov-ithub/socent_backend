class Enterprise < ApplicationRecord
  belongs_to :primary_industry_classification, class_name: 'IndustryClassification', optional: true
  belongs_to :social_intervention_domain, optional: true
  belongs_to :enterprise_category, optional: true
  belongs_to :entrepreneur, optional: true

  validates :number, uniqueness: true, presence: true
  validates :application_date, presence: true
  validates :name, presence: true
end
