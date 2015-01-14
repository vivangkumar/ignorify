# Ignorify

A simple command line tool to pull .gitignore files.


## Installation

Install using gem

	gem install ignorify

Or clone the repository and build a gem:
	
	gem build ignorify.gemspec

And then install the gem.

Alternatively, use
	
	rake install

## Docs

### How it works

Ignorify crawls the github/gitignore repository to get the lastest gitignore files.
It then downloads and creates a .gitignore file in the directory.

### Available commands

- `list`: Shows a list of all available files.
- `help`: Shows available commands.
- `version`: Returns the current version number.
- `create <filename>`: Places a .gitignore file in the current directory.

### Usage

```
ignorify create java
```
will return a success message.

If the file searched for is not available, an error message will be shown.

### Dependencies

- Thor
- Nokogiri
- Colorize

## Contributing

1. Fork it ( https://github.com/vivangkumar/ignorify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
