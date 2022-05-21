# webmention-cli

**A command-line interface for Webmention written in Ruby.**

[![Gem](https://img.shields.io/gem/v/webmention-cli.svg?logo=rubygems&style=for-the-badge)](https://rubygems.org/gems/webmention-cli)
[![Downloads](https://img.shields.io/gem/dt/webmention-cli.svg?logo=rubygems&style=for-the-badge)](https://rubygems.org/gems/webmention-cli)
[![Build](https://img.shields.io/github/workflow/status/jgarber623/webmention-cli/CI?logo=github&style=for-the-badge)](https://github.com/jgarber623/webmention-cli/actions/workflows/ci.yml)
[![Maintainability](https://img.shields.io/codeclimate/maintainability/jgarber623/webmention-cli.svg?logo=code-climate&style=for-the-badge)](https://codeclimate.com/github/jgarber623/webmention-cli)
[![Coverage](https://img.shields.io/codeclimate/c/jgarber623/webmention-cli.svg?logo=code-climate&style=for-the-badge)](https://codeclimate.com/github/jgarber623/webmention-cli/code)

## Getting Started

Before installing and using webmention-cli, you'll want to have [Ruby](https://www.ruby-lang.org) 2.6 (or newer) installed. It's recommended that you use a Ruby version managment tool like [rbenv](https://github.com/rbenv/rbenv), [chruby](https://github.com/postmodern/chruby), or [rvm](https://github.com/rvm/rvm).

webmention-cli is developed using Ruby 2.6.10 and is additionally tested against Ruby 2.7, 3.0, and 3.1 using [GitHub Actions](https://github.com/jgarber623/webmention-cli/actions).

## Installation

```sh
gem install webmention-cli
```

## Usage

webmention-cli makes available the following commands:

### `webmention endpoint <target>`

Discover the Webmention endpoint for a `<target>` URL.

```sh
$ webmention endpoint https://sixtwothree.org
https://sixtwothree.org/webmentions
```

The command returns a non-zero exit code if the `<target>` URL does not advertise a Webmention endpoint (or if an HTTP error was encountered).

### `webmention send <source> <target>`

Send a webmention from a `<source>` URL to a `<target>` URL.

```sh
$ webmention send https://sixtwothree.org/posts/an-engineer-walks-into-a-design-sprint https://adactio.com/journal/6246
202 Accepted
```

The command will return either an HTTP status _or_ the value of the response's `Location` header (if provided _and_ the response's HTTP status is `201 Created`).

A non-zero exit code is returned if the HTTP status is _not_ within the 200 range (or if an HTTP error was encountered).

#### Send a webmention with a vouch URL

```sh
$ webmention send https://sixtwothree.org/posts/now-accepting-webmentions https://aaronparecki.com --vouch https://adactio.com/links/9229
202 Accepted
```

The command with a vouch URL included responds in the same fashion as noted above.

### `webmention verify <source> <target>`

Confirm whether or not a `<source>` URL links to a `<target>` URL.

```sh
$ webmention verify https://kartikprabhu.com/notes/re-launching-franciscms https://sixtwothree.org/posts/launching-franciscms-onto-the-indieweb
```

The command will return a zero exit code if `<source>` links to `<target>` and a non-zero exit code in all other cases.

#### Verify a webmention with a vouch URL

```sh
$ webmention verify https://kartikprabhu.com/notes/re-launching-franciscms https://sixtwothree.org/posts/launching-franciscms-onto-the-indieweb --vouch https://adactio.com/links/9229
```

The command will return a zero exit code if `<source>` links to `<target>` _and_ the provided vouch URL links to the `<source>`'s domain. A non-zero exist code is returned in all other cases.

## Contributing

Interested in helping improve webmention-cli? Awesome! Your help is greatly appreciated. See [CONTRIBUTING.md](https://github.com/jgarber623/webmention-cli/blob/main/CONTRIBUTING.md) for details.

## Acknowledgments

webmention-cli wouldn't exist without Webmention and the hard work put in by everyone involved in the [IndieWeb](https://indieweb.org) movement.

webmention-cli is written and maintained by [Jason Garber](https://sixtwothree.org).

## License

webmention-cli is freely available under the [MIT License](https://opensource.org/licenses/MIT). Use it, learn from it, fork it, improve it, change it, tailor it to your needs.
