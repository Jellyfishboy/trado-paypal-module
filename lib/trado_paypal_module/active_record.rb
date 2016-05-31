module TradoPaypalModule
    module ActiveRecord
        extend ActiveSupport::Concern

        module ClassMethods
            def has_order_paypal
                attr_accessible :paypal_express_token, :paypal_express_payer_id
            end

            def has_transaction_paypal
                attr_accessible :paypal_id
            end

            def has_store_setting_paypal
                attr_accessible :paypal_currency_code

                validates :paypal_currency_code, presence: true
            end
        end
    end
end