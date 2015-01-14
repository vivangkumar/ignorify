require "ignorify/version"
require "thor"
require_relative "util"
require "colorize"

module Ignorify
  class Ignorify < Thor

    # Lists all available commands.
    # 
    # Example:
    #   ignorify list
    #
    # Prints to stdout.
    desc "list", "List all available .gitignore files."
    def list
      $stdout.puts Utils.file_list.keys
    end

    # Prints the current ignorify version.
    # 
    # Example:
    #   jaignorifyg version
    #
    # Prints to stdout.
    desc "version", "Get current ignorify version."
    def version
      $stdout.puts VERSION
    end

    # Creates a new file in the directory.
    # 
    # Example:
    # ignorify create java
    #
    # Prints to stdout.
    desc "create <FILENAME>", "Places required .gitignore file"
    def create(name)
      file_list = Utils.file_list
      if file_list.has_key? name
        Utils.create_file(file_list[name])
        if File.exist?(Utils::FILENAME) && Utils::FILENAME.size != 0
          $stdout.puts ".gitignore created".green
        else
          $stdout.puts "Error creating .gitignore".red
        end
      else
        $stdout.puts "File was not found in the git repository".red
      end
    end
  end
end
