class EntrepreneurSerializer < ActiveModel::Serializer
  attributes :id, 
    :identification_number,
    :name,
    :card_type,
    :card_series,
    :card_number,
    :issued_by,
    :issued_at,
    :designation,
    :proof_of_designation_url
end
