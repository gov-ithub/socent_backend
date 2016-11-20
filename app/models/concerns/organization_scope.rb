module OrganizationScope

  def self.current_organization_id
    Thread.current[:current_organization_id]
  end

  def self.current_organization_id=(value)
    Thread.current[:current_organization_id]=value
  end

  def self.with_organization_id(organization_id, &block)
    prev_id = self.current_organization_id
    begin
      self.current_organization_id = organization_id
      yield
    ensure
      self.current_organization_id = prev_id
    end
  end

end
