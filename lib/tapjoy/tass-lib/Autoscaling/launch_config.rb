module Tapjoy
  module TassLib
    module AWS
      module Autoscaling
        # This module includes autoscaling launch config calls to AWS
        module LaunchConfig
          class << self
            def client
              @client ||= Tapjoy::TassLib::AWS::Autoscaling.client
            end

            def delete
              self.client.delete_launch_configuration(
                launch_configuration_name: Tapjoy::TassLib.config_name)
            end

            def create(image_id:, instance_type:, security_groups:, user_data:,
              keypair:, iam_instance_profile:, classic_link_vpc_id: nil,
              classic_link_sg_ids: nil, **unused_values)

              self.client.create_launch_configuration(
                launch_configuration_name: Tapjoy::TassLib.config_name,
                image_id: image_id,
                iam_instance_profile: iam_instance_profile,
                instance_type: instance_type,
                security_groups: security_groups,
                user_data: "#{Tapjoy::TassLib::Autoscaling::Group.new.encode_user_data(user_data)}",
                key_name: keypair,
                classic_link_vpc_id: classic_link_vpc_id,
                classic_link_vpc_security_groups: classic_link_sg_ids,
              )
            end

            def describe(config_name)
              # config_name is scoped locally, since we can't always be sure
              # that we are using the default launch_configuration name
              self.client.describe_launch_configurations(
                launch_configuration_names:[config_name])[0][0]
            end
          end
        end
      end
    end
  end
end
