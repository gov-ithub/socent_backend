module OrganizationScopedController
  extend ActiveSupport::Concern

  def current_organization_id
    session[:organization_id]
  end

  module ClassMethods
  
    def organization_scoped(opts = {})
      before_action opts do
        Thread.current[:current_organization_id] = self.current_organization_id
      end
    end

  end
end
