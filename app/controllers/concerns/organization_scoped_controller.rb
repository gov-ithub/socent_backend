module OrganizationScopedController
  extend ActiveSupport::Concern

  def current_organization_id
    OrganizationScope.current_organization_id
  end

  module ClassMethods
  
    def organization_scoped(opts = {})
      before_action opts do
        OrganizationScope.current_organization_id = self.current_organization_id
      end
    end

  end
end
