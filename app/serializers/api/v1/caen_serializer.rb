class Api::V1::CaenSerializer < ActiveModel::Serializer
  attributes :id, :code, :description
end
