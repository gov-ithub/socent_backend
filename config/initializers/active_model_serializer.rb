ActiveSupport.on_load(:action_controller) do
  ActiveModelSerializers.config.adapter = ActiveModelSerializers::Adapter::Json
end
