![alt text](http://cdn0.trado.io/trado-promo/assets/img/cropped.png "Trado")

# Paypal Module
Module for Paypal payment functionality in the Trado Ecommerce platform. If you would like to get started using the Trado Ecommerce platform, head on over to the [Official site](http://www.trado.io/?utm_source=github&utm_medium=website&utm_campaign=trado)!

[Release notes](http://release.tomdallimore.com/projects/trado-paypal)

## Installation

Add module to your Gemfile:

```ruby
gem 'trado_paypal_module', github: 'Jellyfishboy/trado-paypal-module', branch: 'master'
gem 'offsite_payments'
gem 'activemerchant'
```

Then run bundle to install the Gem:

```sh
bundle install
```

Now generate migrations, create helpers, set up environment configurations and assign model concerns:

```sh
rails generate trado_paypal_module:install
bundle exec rake db:migrate
```

Assign Paypal sensitive data:

**config/secrets.yml**

```yaml
development:
    transaction_link: "https://sandbox.paypal.com/cgi-bin/webscr?cmd=_view-a-trans&id="  
    paypal_login: me@example.com  
    paypal_password: 873264823432  
    paypal_signature: VUYWIUBDBDQowqdgiuwdowbqwbQDQJW6  
production:
    transaction_link: "https://sandbox.paypal.com/cgi-bin/webscr?cmd=_view-a-trans&id="  
    paypal_login: me@example.com  
    paypal_password: 873264823432  
    paypal_signature: VUYWIUBDBDQowqdgiuwdowbqwbQDQJW6  
```
*(You can sign up for a PayPal developer account at the [developer dashboard](https://developer.paypal.com))*

Restart the main application server:

```sh
foreman start -f Procfile.dev
```

## Versioning

Trado PayPal module follows Semantic Versioning 2.0 as defined at
<http://semver.org>.

## How to contribute

* Fork the project
* Create your feature or bug fix
* Add the requried tests for it.
* Commit (do not change version or history)
* Send a pull request against the *development* branch

## Copyright
Copyright (c) 2014 [Tom Dallimore](http://www.tomdallimore.com/?utm_source=trado-paypal-module-github&utm_medium=website&utm_campaign=tomdallimore) ([@tom_dallimore](http://twitter.com/tom_dallimore))  
Licenced under the MIT licence.

