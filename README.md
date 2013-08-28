# Alchemy CMS Ferret Search

This gemm provides the from Alchemy 3.0 extracted Ferret full text search.

## Installation

Add this line to your application's Gemfile:

    gem 'alchemy-ferret'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alchemy-ferret

## Usage

You don't have to do anything.

For best performance and stability install a crontab that reindexes ferrets search index periodly.

### Example:

    cd ~/html/alchemy/current && RAILS_ENV=production rake ferret:rebuild_index

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
