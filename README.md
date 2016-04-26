![alt text](http://cdn0.trado.io/trado-promo/assets/img/cropped.png "Trado")

# Paypal Module
Module for Paypal payment functionality in the Trado Ecommerce platform.

## Installation

Add module to your Gemfile:

`gem 'trado_paypal_module', git: "git@github.com:Jellyfishboy/trado-paypal-module.git`

Then run bundle to install the Gem:

`bundle install`

Now generate the migrations, create helpers, set up environment configurations and assign model concerns:

`rails generate trado_paypal_module:install`
`rake db:migrate`

Assign Paypal sensitive data:

**config/secrets.yml**

```
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

Restart the main application server:

`foreman start -f Procfile.dev`



