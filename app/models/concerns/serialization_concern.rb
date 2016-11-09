module SerializationConcern
  extend ActiveSupport::Concern

  def serializer_class
    "Api::V1::#{self.class.name}Serializer".constantize
  end
end
