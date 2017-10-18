# Philippine Ruby Users Group

  * [![Dependency Status](https://gemnasium.com/phrug/pinoyrb.png)](https://gemnasium.com/phrug/pinoyrb)
  * [![Build Status](https://travis-ci.org/phrug/pinoyrb.svg)](https://travis-ci.org/phrug/pinoyrb)

Yay, bagong website. LOL

http://pinoyrb.org

## Requirements

* Postgresql 9.6
* ruby 2.3.5

## Developing Pinoyrb

Install dependencies and run the following on your terminal:

```
# Clone and setup to the repo
$ git clone git@github.com:phrug/pinoyrb.git
$ cd pinoyrb
$ bundle install
$ bundle exec rake db:setup

# Run tests
$ bundle exec rspec spec

# Run server
$ bundle exec rails server
```
