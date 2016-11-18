module OrganizationScopedModel
  extend ActiveSupport::Concern

  module ClassMethods
    def organization_scoped(opts = {})
      belongs_to :organization, optional: true
      self.default_scope -> { 
        organization_id = Thread.current[:current_organization_id]
        organization_id ? self.where(organization_id: organization_id) : self.all
      }
    end
  end

end
