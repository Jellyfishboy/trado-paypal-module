# trado-paypal-module
Module for Paypal payment functionality in the Trado Ecommerce platform.

## Paypal

Run `rails generate trado_paypal_module:install`

Update database `rake db:migrate`

Restart main application server `foreman start -f Procfile.dev`

### Secrets

#### Development, Production

```
    transaction_link: "https://sandbox.paypal.com/cgi-bin/webscr?cmd=_view-a-trans&id="  
    paypal_login: me@example.com  
    paypal_password: 873264823432  
    paypal_signature: VUYWIUBDBDQowqdgiuwdowbqwbQDQJW6  
```

### Environment configs

#### Test

```
    config.after_initialize do
        ActiveMerchant::Billing::Base.mode = :test
        ::EXPRESS_GATEWAY = ActiveMerchant::Billing::BogusGateway.new
    end
```

#### Development
    
```
    config.after_initialize do
        ActiveMerchant::Billing::Base.mode = :test
        paypal_options = {
            login: Rails.application.secrets.paypal_login,
            password: Rails.application.secrets.paypal_password,
            signature: Rails.application.secrets.paypal_signature
        }
        ::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
    end
```

#### Production

```
    config.after_initialize do
        paypal_options = {
            login: Rails.application.secrets.paypal_login,
            password: Rails.application.secrets.paypal_password,
            signature: Rails.application.secrets.paypal_signature
        }
        ::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
    end
```

### Models

#### Order

`has_order_paypal`

#### Transaction

`has_transation_paypal`

#### StoreSetting

`has_store_setting_paypal`

