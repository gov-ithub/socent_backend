class VulnerableGroupSerializer < ActiveModel::Serializer
  attributes :id, :description, :subgroups
end
