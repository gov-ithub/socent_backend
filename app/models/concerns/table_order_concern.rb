module TableOrderConcern
  extend ActiveSupport::Concern

  TABLE_ORDER = [
    Enterprise,
    Entrepreneur,
    IndustryClassification,
    EnterpriseCategory,
    SocialInterventionDomain,
    SocialInterventionDomainCategory,
    User,
    Organization]

end
