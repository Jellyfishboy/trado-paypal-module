module PaypalHelper

    def paypal_active?
        Object.const_defined?('TradoPaypalModule') ? true : false
    end
end