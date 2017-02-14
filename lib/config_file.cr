# Sdns::ConfigFile
#
# Manages everything to do with the .sdns.yaml file that contains the DNS server settings.
#
module Sdns
  class ConfigFile
    def initialize
    end

    def path
    end

    def exists?
    end

    def create
      return if exists?
    end
  end
end
