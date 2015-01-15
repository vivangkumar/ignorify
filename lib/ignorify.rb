require "ignorify/version"
require "thor"
require_relative "util"
require "colorize"

module Ignorify
  class Ignorify < Thor

    # Lists all available ignorify commands.
    # 
    # Example:
    #   >> ignorify list
    #
    # Prints to stdout.
    desc "list", "List available .gitignore files."
    def list
      $stdout.puts Utils.file_list.keys
    end

    # Prints the current ignorify version.
    # 
    # Example:
    #   >> ignorify version
    #
    # Prints to stdout.
    desc "version", "Get current ignorify version."
    def version
      $stdout.puts VERSION
    end

    # Downloads the specified .gitignore file.
    # Saves it to the working directory.
    #
    # Example:
    #   >> ignorify create java
    #
    # Arguments:
    #   name: (String)
    #
    # Prints to stdout.
    desc "create <FILENAME>", "Downloads required .gitignore file"
    def create(name)
      file_list = Utils.file_list
      if file_list.has_key? name
        if Utils.create_file(file_list[name])
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
