# Sdns::ConfigFile
#
# Manages everything to do with the .sdns.yaml file that contains the DNS server settings.
#
module Sdns
  class ConfigFile
    DNS_TEMPLATE_FILE = "sdns.yaml"
    DEFAULT_DNS_FILE  = "#{`echo ~`.strip}/.sdns.yaml"

    getter :dns_file_path

    def initialize(file_path : String = "")
      @dns_file_path = file_path.blank? ? DEFAULT_DNS_FILE : file_path
    end

    # Checks to see if the DNS settings file exists
    def exists?
      File.exists?(dns_file_path)
    end

    # Creates the DNS settings file if it doesn't exist
    def create
      return if exists?

      File.write(dns_file_path, File.read(DNS_TEMPLATE_FILE))
    end
  end
end
