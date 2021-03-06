require 'spec_helper'
require_relative '../lib/ignorify'
require_relative '../lib/ignorify/version'
require "colorize"

describe Ignorify::Ignorify do
  before(:all) do
    FileUtils.rm(".gitignore")
  end

  describe "#list" do
    it "should list all available .gitignore files" do
      file_list = Ignorify::Utils.file_list.keys.join("\n") + "\n"
      list_task = capture(:stdout) { Ignorify::Ignorify.start(['list']) }
      expect(list_task).to eq(file_list)
    end
  end

  describe "#create" do
    it "should create a new .gitignore file" do
      args = %w[create java]
      create_task = capture(:stdout) { Ignorify::Ignorify.start(args) }
      expect(create_task).to eq(".gitignore created".green + "\n")
    end

    it "should show an error if the file is not in the list" do
      args = %w[create randomlanguage]
      create_task = capture(:stdout) { Ignorify::Ignorify.start(args) }
      expect(create_task).to eq("File was not found in the git repository".red + "\n")
    end
  end

  describe "#version" do
    it "should show the current version number" do
      args = %w[version]
      version_task = capture(:stdout) { Ignorify::Ignorify.start(args) }
      expect(version_task).to eq(Ignorify::VERSION + "\n")
    end
  end

  describe "#search" do
    it "should search the list for a term" do
      args = %w[search ruby]
      search_task = capture(:stdout) { Ignorify::Ignorify.start(args) }
      expect(search_task).to eq("Available gitignore files:".green + "\n" + "ruby\n")
    end
    it "should show an error if a file cannot be found" do
      args = %w[search xxctgft]
      search_task = capture(:stdout) { Ignorify::Ignorify.start(args) }
      expect(search_task).to eq("No gitignore for xxctgft was found".red + "\n")
    end
  end

  # Teardown modified .gitignore
  after(:all) do
    FileUtils.cp('spec/original/gitignore', '.gitignore')
  end
end