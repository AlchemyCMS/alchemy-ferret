require 'alchemy_cms'
require 'acts_as_ferret'
require 'alchemy/ferret/controller_methods'

module Alchemy
  module Ferret
    class Engine < ::Rails::Engine
      config.to_prepare do
        Alchemy::BaseController.send(:include, Alchemy::Ferret::ControllerMethods)
        Alchemy::PasswordsController.send(:include, Alchemy::Ferret::ControllerMethods)
        Alchemy::UserSessionsController.send(:include, Alchemy::Ferret::ControllerMethods)
        require File.expand_path("../../../../app/models/alchemy/content_extension", __FILE__)
        require File.expand_path("../../../../app/models/alchemy/essence_text_extension", __FILE__)
        require File.expand_path("../../../../app/models/alchemy/essence_richtext_extension", __FILE__)
      end
    end
  end
end
