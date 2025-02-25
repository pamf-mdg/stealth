# <a href='https://hellostealth.org'><img src='logo.svg' height='120' alt='Stealth Logo' aria-label='hellostealth.org' /></a>

Stealth is an open source Ruby framework for creating text and voice chatbots. It's design is inspired by Ruby on Rails's philosophy of convention over configuration. It has an MVC architecture with the slight caveat that `views` are aptly named `replies`.

[![CircleCI](https://circleci.com/gh/whoisblackops/stealth.svg?style=svg&circle-token=63fb0f94994daf358fab46dd716e4da3578fd530)](https://circleci.com/gh/whoisblackops/stealth)

## Features

* Deploy anywhere, it's just a Rack app
* Variants allow you to use a single codebase on multiple messaging platforms
* Structured, universal reply format
* Sessions utilize a state-machine concept and are Redis backed
* Highly scalable. Incoming webhooks are processed via a Sidekiq queue
* Built-in best practices: catch-alls (error handling), hello flows, goodbye flows

## Getting Started

Getting started with Stealth is simple:

```
> gem install stealth
> stealth new <bot>
```

## Service Integrations

Stealth is extensible. All service integrations are split out into separate Ruby Gems. Things like analytics and natural language processing ([NLP](https://en.wikipedia.org/wiki/Natural-language_processing)) can be added in as gems as well.

Currently, there are gems for:

### Messaging
* [Facebook Messenger](https://github.com/hellostealth/stealth-facebook)
* [Twilio SMS](https://github.com/hellostealth/stealth-twilio)
* [Smooch](https://github.com/hellostealth/stealth-smooch)

### Voice
* [Alexa Skill](https://github.com/hellostealth/stealth-alexa) (Early alpha)

### Natural Language Processing
* [AWS Comprehend](https://github.com/hellostealth/stealth-aws-comprehend)

### Analytics
* [Mixpanel](https://github.com/hellostealth/stealth-mixpanel)

## Docs

You can find our full docs [here](https://hellostealth.org/docs/). If something is not clear in the docs, please file an issue! We consider all shortcomings in the docs as bugs.

## Versioning

Stealth is versioned uses [Semantic Versioning](https://semver.org), but it's more like the Linux Kernel. Major version releases are just as arbitrary as minor version releases. We strive to never break anything with any version change. Patches are still issues as the "third dot" in the version string.

## License

"Stealth" and the Stealth logo are copyright (c) 2019 The Black Ops Bureau Inc.
