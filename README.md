# validates-correios-cep

[![Gem Version](https://badge.fury.io/rb/validates-correios-cep.svg)](https://badge.fury.io/rb/validates-correios-cep)
[![Gem](https://img.shields.io/gem/dt/validates-correios-cep.svg)]()
[![CI](https://github.com/pedrofurtado/validates-correios-cep/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/pedrofurtado/validates-correios-cep/actions/workflows/ci.yml)
[![license](https://img.shields.io/github/license/pedrofurtado/validates-correios-cep.svg)]()

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validates-correios-cep'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validates-correios-cep

## Usage

### ActiveRecord models
```ruby
class Person < ActiveRecord::Base
  validates :my_attribute, correios_cep: true

  # or

  validates_correios_cep_of :my_attribute
end
```

### Plain Old Ruby Objects
```ruby
class Person
  include ActiveModel::Model

  validates :my_attribute, correios_cep: true

  # or

  validates_correios_cep_of :my_attribute
end
```

## I18n

To customize your error messages you can create a locale file like this:

```yaml
en:
  correios_cep:
    errors:
      messages:
        not_exists: '%{zipcode} is not a existent Brazilian zipcode'
        connection_failed: 'failure on connection with Brazilian Correios API'
        invalid: '%{zipcode} is not a valid Brazilian zipcode'
        timeouted: 'timeout with Brazilian Correios API'
```

The %{zipcode} contains the zipcode value, filled by user.

## Something wrong with the translations? Contribute it!

Send a pull request! Fix the translations or create it for some missing locale. Help us to improves the quality of translations!
