module TableOrderConcern
  extend ActiveSupport::Concern

  TABLE_ORDER = [
    Upload,
    Enterprise,
    Entrepreneur,
    IndustryClassification,
    EnterpriseCategory,
    SocialInterventionDomain,
    SocialInterventionDomainCategory,
    District,
    VulnerableGroup
  ]

end
