ActiveSupport.on_load(:action_controller) do
  ActiveModelSerializers.config.adapter = ActiveModelSerializers::Adapter::Json
  ActiveModelSerializers.config.key_transform = :camel_lower
end
