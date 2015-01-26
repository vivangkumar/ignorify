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
    desc "create <FILENAME>", "Downloads required .gitignore file."
    def create(name)
      file_list = Utils.file_list
      
      # Create a file
      create_file = Proc.new do |file_list|
        if file_list.has_key?(name)
          if Utils.create_file(file_list[name])
            $stdout.puts ".gitignore created".green
          else
            $stdout.puts "Error creating .gitignore".red
          end
        else
          $stdout.puts "File was not found in the git repository".red
        end
      end

      if Utils.check_existing_gitignore
        response = ask("There is an already existing .gitignore file.\nDo you wish to overwrite?".red,
          :limited_to => ["y", "n"])

        case response
        when "y"
          create_file.call(file_list)
        when "n"
          $stdout.puts "Exiting.."
          exit 1
        end
      else
        create_file.call(file_list)
      end
    end

    # Search for a filename <FILENAME>.
    # Returns any matches in the gitignore list.
    # 
    # Example:
    #   >> ignorify search ruby
    #
    # Arguments:
    #   term: (String)
    #
    # Prints to stdout.
    desc "search <FILENAME>", "Search for a gitignore and filter results."
    def search(term)
      results = Utils.search(term)
      if results.length > 0
        $stdout.puts "Available gitignore files:".green
        $stdout.puts "#{results.join(", ")}"
      else
        $stdout.puts "No gitignore for #{term} was found".red
      end
    end
  end
end
