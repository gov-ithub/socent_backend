require 'ostruct'

Rails.configuration.x.jwt = OpenStruct.new(Rails.application.config_for(:jwt))
