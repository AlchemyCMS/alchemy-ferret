# Alchemy CMS 3.0 Ferret Search

This gem provides the Ferret full text search, that was extracted from Alchemy 3.0

## Installation

Add this lines to your application's Gemfile:

    gem 'alchemy-ferret'
    gem 'acts_as_ferret', github: 'tvdeyen/acts_as_ferret', branch: 'rails-4'

*) Note about acts_as_ferret version

ActsAsFerret is not yet Rails 4 compatible, so you need to use a Rails 4 compatible version.

And then execute:

    $ bundle

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
