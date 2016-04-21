module TradoPaypalModule
end

require 'trado_paypal_module/version'
require 'trado_paypal_module/active_record'

ActiveRecord::Base.send(:include, TradoPaypalModule::ActiveRecord)
