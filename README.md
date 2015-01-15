# Ignorify 
[![Build Status](https://travis-ci.org/vivangkumar/ignorify.svg)](https://travis-ci.org/vivangkumar/ignorify)

A simple command line tool to pull and save .gitignore files!

## Installation

Install using gem

`gem install ignorify`

Or clone the repository and build a gem:
	
`gem build ignorify.gemspec`

And then install the gem.

Alternatively, use
	
`rake install`

## Running Tests

`rspec`

## Docs

### How it works

Ignorify crawls the github/gitignore repository to get the lastest gitignore files.
It then downloads and creates a .gitignore file in the directory.
The file is fetched using cURL.
But, if cURL is not installed, it manually grabs by crawling.

### Available commands

- `list`: Shows a list of all available files.
- `help`: Shows available commands.
- `version`: Returns the current version number.
- `create <filename>`: Places a .gitignore file in the current directory.

### Usage

`ignorify create java`

will return

```
Fetching gitignore...
######################################################################## 100.0%
.gitignore created
```

If the file searched for is not available, an error message will be shown.

`File was not found in the git repository`

### Dependencies

- Thor: Library to build CLI's.
- Nokogiri: A web crawler.
- Colorize: Easily adds colours to the terminal.
- Rspec: Ruby's favourite testing tool.

## Contributing

1. Fork it ( https://github.com/vivangkumar/ignorify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
