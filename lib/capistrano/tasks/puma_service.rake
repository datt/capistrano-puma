git_plugin = self

namespace :puma do
  desc 'Setup puma service configuration'
  task :puma_service_config do
    on roles(fetch(:puma_nginx, :web)) do |role|
      git_plugin.puma_switch_user(role) do
        git_plugin.template_puma('puma_service', "/tmp/puma_service_#{fetch(:puma_service_name)}.service", role)
        sudo :mv, "/tmp/puma_service_#{fetch(:puma_service_name)}.service #{fetch(:system_path)}/puma_#{fetch(:puma_service_name)}.service"
      end
    end
  end
end