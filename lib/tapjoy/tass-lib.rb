require_relative 'tass-lib/autoscaling'
require_relative 'tass-lib/elb'
require_relative 'tass-lib/ec2'
require_relative 'tass-lib/cloudwatch'
require_relative 'tass-lib/autoscaling'
require_relative 'tass-lib/Autoscaling/group'
require_relative 'tass-lib/Autoscaling/launch_config'
require 'aws-sdk-core'
require 'yaml'

module Tapjoy
  # Module for Autoscaling Bootstrap
  module TassLib
    # This class is meant for class and instances variables used throughout
    # the application.
    class << self
      attr_accessor :scaler_name, :config_name, :create_elb
      attr_reader :elb_name

      def elb_name=(str)
        @elb_name = str
      end

      def policy
        @policy = Tapjoy::TassLib::Autoscaling::Policy.new
      end

      def group
        @group = Tapjoy::TassLib::Autoscaling::Group.new
      end

      def config
        @config = Tapjoy::TassLib::Autoscaling::Config.new
      end

      def cloudwatch
        @cloudwatch = Tapjoy::TassLib::CloudWatch.new
      end
    end

    class Base
      def load_yaml(filename)
        abort("ERROR: '#{filename}' is not readable") unless File.readable?(filename)
        Hash[YAML.load_file(filename)]
      end
    end
  end
end
