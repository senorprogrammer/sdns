require "yaml"

class DnsList
  def initialize(file : String = "")
    @file = file.blank? ? "./dns.yaml" : file
    @data = YAML.parse(File.read(@file))
    @interface = "Wi-Fi"
  end

  # Returns whatever the OS says are the current DNS settings
  def current
    result = `networksetup -getdnsservers #{@interface}`

    set = find_set_by_ip_address(result.split("\n").first)

    puts (set["name"].to_s + ":") if set
    puts result
  end

  # Displays the list of available DNS server sets as human-readable output
  def list
    table = TerminalTable.new
    table.headings = ["Key", "Name", "Servers"]
    table.separate_rows = true

    @data["sets"].each do |set|
      key = set["key"]
      name = set["name"]
      servers = set["servers"].join("\n")

      table << [key.to_s, name.to_s, servers.to_s]
    end

    puts table.render
  end

  # Switches back to the default DNS settings, which is generally whatever
  # the router or ISP has assigned
  def default
    `networksetup -setdnsservers #{@interface} Empty`
    puts current
  end

  # Switches the DNS servers to the specified set
  # If this command received 'Empty' or 'empty' then it
  # deletes any custom DNS settings by switching back to the default
  def switch(val)
    default && return if val.downcase == "empty"

    set = find_set_by_key(val)
    set = find_set_by_name(val) unless set

    if set
      servers = set["servers"].join(" ")

      `networksetup -setdnsservers #{@interface} #{servers}`

      puts current
    end
  end

  # -------------------- Private Methods --------------------

  private def find_set_by_key(key)
    @data["sets"].each do |set|
      return set if set["key"] == key
    end
  end

  private def find_set_by_name(name)
    @data["sets"].each do |set|
      return set if (set["name"].to_s.downcase == name.downcase)
    end
  end

  private def find_set_by_ip_address(address)
    @data["sets"].each do |set|
      return set if set["servers"].includes?(address)
    end
  end
end
