# webmention-cli

**A command-line interface for Webmention written in Ruby.**

[![Gem](https://img.shields.io/gem/v/webmention-cli.svg?logo=rubygems&style=for-the-badge)](https://rubygems.org/gems/webmention-cli)
[![Downloads](https://img.shields.io/gem/dt/webmention-cli.svg?logo=rubygems&style=for-the-badge)](https://rubygems.org/gems/webmention-cli)
[![Build](https://img.shields.io/circleci/build/github/jgarber623/webmention-cli?logo=circleci&style=for-the-badge)](https://app.circleci.com/pipelines/github/jgarber623/webmention-cli)
[![Maintainability](https://img.shields.io/codeclimate/maintainability/jgarber623/webmention-cli.svg?logo=code-climate&style=for-the-badge)](https://codeclimate.com/github/jgarber623/webmention-cli)
[![Coverage](https://img.shields.io/codeclimate/c/jgarber623/webmention-cli.svg?logo=code-climate&style=for-the-badge)](https://codeclimate.com/github/jgarber623/webmention-cli/code)

## Getting Started

Before installing and using webmention-cli, you'll want to have [Ruby](https://www.ruby-lang.org) 2.5 (or newer) installed. It's recommended that you use a Ruby version managment tool like [rbenv](https://github.com/rbenv/rbenv), [chruby](https://github.com/postmodern/chruby), or [rvm](https://github.com/rvm/rvm).

webmention-cli is developed using Ruby 2.5.8 and is additionally tested against Ruby 2.6 and 2.7 using [CircleCI](https://app.circleci.com/pipelines/github/jgarber623/webmention-cli).

## Installation

```sh
gem install webmention-cli
```

## Usage

webmention-cli makes available the following commands:

### `webmention endpoint <target>`

Discover the webmention endpoint for the given `<target>` URL using the [webmention-endpoint-ruby](https://github.com/jgarber623/webmention-endpoint-ruby) gem's endpoint discovery.

```sh
$ webmention endpoint https://sixtwothree.org
https://sixtwothree.org/webmentions
```

### `webmention send <source> <target>`

Send a webmention from `<source>` URL to the given `<target>` URL using the [webmention-client-ruby](https://github.com/indieweb/webmention-client-ruby) gem.

```sh
$ webmention send https://sixtwothree.org/posts/an-engineer-walks-into-a-design-sprint https://adactio.com/journal/6246
202 Accepted
```

The `send` command will return either an HTTP status _or_ the value of the response's `Location` header (if provided _and_ the response's HTTP status is `201 Created`).

### `webmention verify <source> <target>`

Confirm whether or not a `<source>` URL links to the given `<target>` URL using the [webmention-verification-ruby](https://github.com/jgarber623/webmention-verification-ruby) gem's verifers.

```sh
$ webmention verify https://kartikprabhu.com/notes/re-launching-franciscms https://sixtwothree.org/posts/launching-franciscms-onto-the-indieweb
true
```

By default, the `verify` command will strictly match URLs. For a bit more flexibility, use the `--no-strict` flag:

```sh
$ webmention verify https://aaronparecki.com/2014/12/17/5/webmention-indieweb https://sixtwothree.org/posts/open-sourcing-my-webmention-service --no-strict
true
```

## Contributing

Interested in helping improve webmention-cli? Awesome! Your help is greatly appreciated. See [CONTRIBUTING.md](https://github.com/jgarber623/webmention-cli/blob/main/CONTRIBUTING.md) for details.

## Acknowledgments

webmention-cli wouldn't exist without Webmention and the hard work put in by everyone involved in the [IndieWeb](https://indieweb.org) movement.

webmention-cli is written and maintained by [Jason Garber](https://sixtwothree.org).

## License

webmention-cli is freely available under the [MIT License](https://opensource.org/licenses/MIT). Use it, learn from it, fork it, improve it, change it, tailor it to your needs.
