module Capistrano
  class Puma::PumaService < Capistrano::Plugin
    include PumaCommon
    def set_defaults
      # Puma Service configuration
      set_if_empty :puma_service_name, -> { "#{fetch(:application)}" }
      # set_if_empty :ruby_version, -> { "#{fetch(:RUBY_VERSION)}" }
    end

    def define_tasks
      eval_rakefile File.expand_path('../../tasks/puma_service.rake', __FILE__)
    end
  end
end
