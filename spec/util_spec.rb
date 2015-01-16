require 'spec_helper'
require_relative '../lib/util'
require "colorize"

describe Ignorify::Utils do
  describe "#file_list" do
    files = Ignorify::Utils.file_list
    it "should return a Hash" do
      expect(files).to be_an_instance_of(Hash)
    end
    it "should have a length greater than zero" do
      expect(files.length).to be > 0
    end
  end

  describe "#create_file" do
    it "should return true when a valid file is passed" do
      file_created = Ignorify::Utils.create_file("ruby")
      expect(file_created).to be true
    end
  end

  describe "#search" do
    results = Ignorify::Utils.search("ruby")
    it "should return results for a term" do
      expect(results).to eq(["ruby"])
    end
    it "should return an Array" do
      expect(results).to be_an_instance_of(Array)
    end
    it "should return an empty array for an invalid term" do
      expect(Ignorify::Utils.search("xrbgt").length).to eq(0)
    end
  end

  # Teardown modified .gitignore
  after(:all) do
    FileUtils.cp('spec/original/gitignore', '.gitignore')
  end
end
