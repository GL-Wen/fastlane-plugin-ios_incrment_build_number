require 'fastlane/action'
require_relative '../helper/ios_incrment_build_number_helper'

module Fastlane
  module Actions
    class IosIncrmentBuildNumberAction < Action
      def self.run(params)
        UI.message("The ios_incrment_build_number plugin is working!")

        version = params[:version]
        build   = params[:buildVersion]

        versionArr = version.split(".")
        buildArr   = build.split(".")

        b = build.start_with? version

        if b == false or versionArr.length == buildArr.length
          build = version + ".1"
        else 
          lastNum = buildArr.last.to_i + 1
          buildArr[-1] = lastNum 
          build = buildArr.join(sep=".")
        end

        UI.message("The build version number is " + build)

        return build

      end

      def self.description
        "increment build version number based on version"
      end

      def self.authors
        ["william"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "increment iOS build version number based on version. for example version is 1.0, build version is 1.0.x, version is 1.0.1, build version is 1.0.1.x"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :version,
                               description: "project short version number",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :buildVersion,
                               description: "project current build version number",
                                  optional: true,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        [:ios].include?(platform)
      end
    end
  end
end
