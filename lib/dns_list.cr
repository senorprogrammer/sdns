require "yaml"

class DnsList
  def initialize(file : String = "")
    @file = file.blank? ? "./dns.yaml" : file
    @data = YAML.parse(File.read(@file))
  end

  def current
    puts `networksetup -getdnsservers Wi-Fi`
  end

  # Displays the list of available DNS server sets as human-readable output
  def list
    table = TerminalTable.new
    table.headings = ["Key", "Name", "Servers"]
    table.separate_rows = true

    @data["sets"].each do |set|
      key = set["key"]
      name = set["name"]
      addresses = set["servers"].join("\n")

      table << [key.to_s, name.to_s, addresses.to_s]
    end

    puts table.render
  end
end
