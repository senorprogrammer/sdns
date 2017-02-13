require "commander"
require "dns_list"
require "terminal_table"

cli = Commander::Command.new do |cmd|
  cmd.use = "sdns"
  cmd.long = "Utility for switching DNS server sets from the command line."

  cmd.commands.add do |cmd|
    cmd.use = "current"
    cmd.short = "Displays the current DNS settings."
    cmd.long = cmd.short
    cmd.run do |opts, args|
      DnsList.new.current
    end
  end

  cmd.commands.add do |cmd|
    cmd.use = "list"
    cmd.short = "List the available DNS sets."
    cmd.long = cmd.short
    cmd.run do |opts, args|
      DnsList.new.list
    end
  end

  cmd.commands.add do |cmd|
    cmd.use = "switch <id>"
    cmd.short = "Switch to the specified DNS set."
    cmd.long = cmd.short
    cmd.run do |opts, args|
      puts "#{opts} | #{args}"
    end
  end
end

Commander.run(cli, ARGV)
