# Sdns::ConfigFile
#
# Manages everything to do with the .sdns.yaml file that contains the DNS server settings.
#
module Sdns
  class ConfigFile
    DEFAULT_DNS_FILE = "#{Dir.home}/.sdns.yaml"

    getter :file_path

    def initialize(file_path : String = "")
      @file_path = file_path.blank? ? DEFAULT_DNS_FILE : file_path
    end

    # Checks to see if the DNS settings file exists
    def exists?
      File.exists?(file_path)
    end

    # Creates the DNS settings file if it doesn't exist
    def create
      return if exists?

      File.write(DEFAULT_DNS_FILE, "cats")
    end
  end
end
