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
    User,
    Organization,
    District,
    VulnerableGroup
  ]

end
