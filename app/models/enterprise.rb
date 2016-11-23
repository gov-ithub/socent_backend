class Enterprise < ApplicationRecord
  belongs_to :primary_industry_classification, class_name: 'IndustryClassification', optional: true
  belongs_to :primary_social_intervention_domain, class_name: 'SocialInterventionDomain', optional: true
  belongs_to :enterprise_category, optional: true
  belongs_to :entrepreneur, optional: true
  has_many :uploads, dependent: :delete_all

  has_one :headquarters, foreign_key: :headquarters_for_enterprise_id, class_name: 'Address',
          inverse_of: :headquarters_for_enterprise, dependent: :destroy
  has_many :work_locations, foreign_key: :work_location_for_enterprise_id, class_name: 'Address',
           inverse_of: :work_location_for_enterprise, dependent: :destroy


  validates :number, uniqueness: true, presence: true
  validates :application_date, presence: true
  validates :name, presence: true
end
