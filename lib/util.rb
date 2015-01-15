require "nokogiri"
require "open-uri"

module Ignorify

  # Utility class.
  # Generates file list and downloads gitignores.
  class Utils

    REPOSITORY_URL = "https://github.com/github/gitignore"
    REPOSITORY_RAW_URL = "https://raw.githubusercontent.com/github/gitignore/master/"
    FILENAME = ".gitignore";

    # Get file list from Github repository.
    # Crawls the github repository.
    # Generates a hash with lowercase values mapped to crawled values.
    #
    # Returns:
    #   Hash
    def self.file_list
      file_list = {}
      
      page = Nokogiri::HTML(open(REPOSITORY_URL))
      page.css('td.content span.css-truncate a').each do |tr|
        if tr.content.end_with?(FILENAME)
          trimmed_name = tr.content.chomp(FILENAME)
          file_list[trimmed_name.downcase] = trimmed_name
        end
      end
      return file_list
    end

    # Grabs the latest gitignore.
    # Saves .gitignore.
    # We check to see if cURL is installed.
    #
    # As a fallback, scrape the file.
    # Arguments:
    #   name: (String)
    #
    # Returns:
    #   Boolean
    def self.create_file(name)
      request_url = REPOSITORY_RAW_URL + name + FILENAME
      system("curl -V > /dev/null")

      if $? == 0
        system("echo Fetching gitignore...")
        file_created = system("curl --progress -o #{FILENAME} #{request_url}")
        return file_created
      else
        file = Nokogiri::HTML(open(request_url))
        file_content = file.css('body p').text

        File.open(FILENAME, "w") do |file|
          file.write(file_content)
        end

        if File.exist?(FILENAME) && FILENAME.size > 0
          return true
        else
          return false
        end
      end
    end
  end
end