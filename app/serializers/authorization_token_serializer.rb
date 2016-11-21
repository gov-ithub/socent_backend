class AuthorizationTokenSerializer < ActiveModel::Serializer
  attributes :token, :exp, :user_name
end
