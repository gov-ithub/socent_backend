class AuthorizationToken
  include ActiveModel::Model
  include ActiveModel::AttributeMethods
  include ActiveModel::Serialization
  attr_accessor :token, :exp, :user_name
end

