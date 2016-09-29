module TradoPaypalModule
end

require 'activemerchant'
require 'offsite_payments'

require 'trado_paypal_module/engine'
require 'trado_paypal_module/version'
require 'trado_paypal_module/active_record'
require 'trado_paypal_module/paypaler'

ActiveRecord::Base.send(:include, TradoPaypalModule::ActiveRecord)
