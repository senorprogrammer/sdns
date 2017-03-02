require "spec"

require "../lib/config_file"

describe Sdns::ConfigFile do
  describe "initialize" do
    # it "defaults" { Sdns::ConfigFile.new.dns_file_path.should eq Sdns::ConfigFile::DEFAULT_DNS_FILE }
    # it "customs" { Sdns::ConfigFile.new("cats").dns_file_path.should eq "cats" }
  end

  describe "#exists?" do
    context "when true" do
      it "" { puts ">> #{Sdns::ConfigFile::DEFAULT_DNS_FILE}" }
    end

    context "when false" do
    end
  end

  describe "#read" do
  end

  describe "#write" do
  end
end
