require "commander"
require "dns_list"
require "terminal_table"
require "version"

cli = Commander::Command.new do |cmd|
  cmd.use = "sdns"
  cmd.long = "Utility for switching DNS server sets from the command line."

  cmd.commands.add do |cmd|
    cmd.use = "current"
    cmd.short = "Displays the current DNS settings."
    cmd.long = cmd.short
    cmd.run do |opts, args|
      Sdns::DnsList.new.current
    end
  end

  cmd.commands.add do |cmd|
    cmd.use = "default"
    cmd.short = "Reset to the default DNS servers."
    cmd.long = cmd.short
    cmd.run do |opts, args|
      Sdns::DnsList.new.default
    end
  end
  cmd.commands.add do |cmd|
    cmd.use = "list"
    cmd.short = "List the available DNS sets."
    cmd.long = cmd.short
    cmd.run do |opts, args|
      Sdns::DnsList.new.list
    end
  end

  cmd.commands.add do |cmd|
    cmd.use = "switch <id>"
    cmd.short = "Switch to the specified DNS set."
    cmd.long = cmd.short
    cmd.run do |opts, args|
      raise "Must provide a key value" if args.empty?
      Sdns::DnsList.new.switch(args[0])
    end
  end

  cmd.commands.add do |cmd|
    cmd.use = "--version"
    cmd.short = "Displays the version."
    cmd.long = cmd.short
    cmd.run do |opts, args|
      puts Sdns::VERSION
    end
  end
end

Commander.run(cli, ARGV)
