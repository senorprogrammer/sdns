# Sdns::ConfigFile
#
# Manages everything to do with the .sdns.yaml file that contains the DNS server settings.
#
require "http/client"

module Sdns
  class ConfigFile
    DNS_TEMPLATE_URL = "https://raw.githubusercontent.com/senorprogrammer/sdns/master/sdns.yaml"
    DEFAULT_DNS_FILE = "#{`echo ~`.strip}/.sdns.yaml"

    def exists?
      File.exists?(DEFAULT_DNS_FILE)
    end

    def write
      return if exists?

      puts "Downloading DNS config file from #{DNS_TEMPLATE_URL}..."

      data = download
      File.write(DEFAULT_DNS_FILE, data)
      puts "Config file installed: #{exists?}"
    end

    private def download
      response = HTTP::Client.get DNS_TEMPLATE_URL
      response.body
    end
  end
end
